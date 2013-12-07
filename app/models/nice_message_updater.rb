class NiceMessageUpdater
  class << self
    attr_accessor :twitter, :redis, :update_needed_key, :search_terms, :max_messages, :search_limit, :refresh_every
  end

  public

  def self.update_needed?
    return !self.redis.exists(self.update_needed_key)
  end

  def self.update
    self.twitter.search(self.search_terms, :count => self.search_limit).collect do |tweet|
      if(!tweet.text.include?("#") && !tweet.text.include?("@") && !tweet.text.include?("://" ))
        sentiment = ActiveSupport::JSON.decode(Sentimentalizer.analyze(tweet.text))

        if(sentiment["sentiment"] == ":)")
          self.redis.lpush(NiceMessages.redis_wordlist_key, tweet.text)
        end
      end
    end

    self.redis.ltrim(NiceMessages.redis_wordlist_key,0,self.max_messages-1)
    self.redis.SETEX(self.update_needed_key.to_s, self.refresh_every.to_s, "1".to_s)
  end
end