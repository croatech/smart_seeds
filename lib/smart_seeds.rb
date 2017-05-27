require 'faker'
require 'bulk_insert'
require 'smart_seeds/performing'
require 'smart_seeds/generator/base'
require 'smart_seeds/generator/binary'
require 'smart_seeds/generator/boolean'
require 'smart_seeds/generator/date'
require 'smart_seeds/generator/datetime'
require 'smart_seeds/generator/decimal'
require 'smart_seeds/generator/float'
require 'smart_seeds/generator/integer'
require 'smart_seeds/generator/string'
require 'smart_seeds/generator/text'
require 'smart_seeds/generator/time'
require 'smart_seeds/generator/integer/enum'
require 'smart_seeds/generator/integer/foreign_key'
require 'smart_seeds/generator/faker'

module SmartSeeds
  def self.plant(model, attrs={}, size=1)
    SmartSeeds::Performing.new(model, attrs, size).start
  end
end
