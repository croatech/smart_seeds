class CreateBigCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :big_categories do |t|
      t.string :name
    end
  end
end