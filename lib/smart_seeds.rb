require_relative 'generating'
require_relative 'performing'

module SmartSeeds
  def self.call(model, attrs={})
    perform = Performing.new(model, attrs)
    perform.call
  end
end
