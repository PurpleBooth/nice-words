class NiceMessages
  class << self
    attr_accessor :redis_wordlist_key, :redis
  end

  private
  def self.messages
    self.redis = Redis.new if self.redis.nil?
    return redis.lrange(self.redis_wordlist_key, 0, -1)
  end

  public

  def self.size
    self.messages
  end

  def self.next(previous)
    id = (previous.to_i+1) % self.messages.size
    return id
  end

  def self.get(id)
    niceMessage = NiceMessage.new(id.to_i, self.messages.at(id.to_i))

    return niceMessage
  end
end