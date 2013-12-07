class NiceMessage
  attr_accessor :id, :message

  def initialize(id, message)
    @id = id
    @message = message
  end

def to_json
  return ActiveSupport::JSON.encode @message
end

  def to_s
    return @message
  end

end
