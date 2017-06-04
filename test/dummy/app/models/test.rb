class Test < ApplicationRecord
  enum status: %i(active in_progress archived)
end
