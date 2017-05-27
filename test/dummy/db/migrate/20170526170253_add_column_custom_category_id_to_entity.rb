class AddColumnCustomCategoryIdToEntity < ActiveRecord::Migration[5.0]
  def change
    add_column :entities, :custom_category_id, :integer
  end
end
