Dir["#{File.dirname(__FILE__)}/smart_seeds/**/*.rb"].each {|file| require file }

module SmartSeeds
  def self.call(model, attrs={})
    perform = SmartSeeds::Performing.new(model, attrs)
    perform.call
  end
end
