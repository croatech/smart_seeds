class Entity < ApplicationRecord
  enum status: %i(active in_progress archived)

  belongs_to :category
  belongs_to :big_category
  belongs_to :custom_category, class_name: 'Category', foreign_key: 'custom_category_id'
end
