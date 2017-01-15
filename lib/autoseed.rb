require_relative 'generating'
require_relative 'performing'

module Autoseed
  def self.call(model, attrs={})
    perform = Performing.new(model, attrs)
    perform.call
  end
end
