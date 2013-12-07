Before do
  @redis = NiceMessages.redis
end

Given(/^I have the following nice messages to display:$/) do |table|
  data = table.raw
  data.shift

  @redis.del(NiceMessages.redis_wordlist_key)
  @redis.setex(NiceMessageUpdater.update_needed_key.to_s, NiceMessageUpdater.refresh_every.to_s, "1".to_s)

  data.each do |v|
    phrase = v.pop
    @redis.lpush NiceMessages.redis_wordlist_key, phrase
  end
end

Given(/^I have no messages to display$/) do
  @redis.del(NiceMessages.redis_wordlist_key)
end


When(/^I display a nice message$/) do
  visit '/'
end

Then(/^I should see (a|another) nice message$/) do |another|
  another = another == "another"
  found = false
  @seenMessages = []

  @redis.lrange(NiceMessages.redis_wordlist_key, 0, -1).each do |v|
    if !found && (!another || (another && !@seenMessages.include?(v) ))
      found = page.has_content? v
      @seenMessages.push v
    end
  end

  assert found
end
