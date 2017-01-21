require 'smart_seeds/performing'
require 'smart_seeds/generator/base'

module SmartSeeds
  def self.call(model, attrs={})
    perform = SmartSeeds::Performing.new(model, attrs)
    perform.call
  end
end
