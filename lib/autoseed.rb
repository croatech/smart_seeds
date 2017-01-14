require_relative 'generating'
require_relative 'performing'

module Autoseed
  def auto_seed(model)
    perform = Performing.new(model)
    perform.call
  end
end
