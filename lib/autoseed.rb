require_relative 'generating'
require_relative 'performing'

module Autoseed
  def self.call(model)
    perform = Performing.new(model)
    perform.call
  end
end
