class Entity < ApplicationRecord
  enum status: %i(active in_progress archived)

  belongs_to :category
end
