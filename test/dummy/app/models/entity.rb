class Entity < ApplicationRecord
  enum status: %i(active in_progress archived)
end
