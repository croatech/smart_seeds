class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.integer :status, default: 0
      t.binary :binary_data
      t.boolean :boolean_data
      t.date :date_data
      t.datetime :datetime_data
      t.decimal :decimal_data
      t.float :float_data
      t.integer :integer_data
      t.string :string_data
      t.text :text_data
      t.time :time_data
      t.integer :category_id
      t.integer :big_category_id

      t.timestamps
    end
  end
end
