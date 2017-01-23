require 'test_helper'

class ForeignKeyTest < ActiveSupport::TestCase
  setup do
    SmartSeeds.plant(Category)
    SmartSeeds.plant(Category)
    SmartSeeds.plant(Category)
    @categories_ids = Category.ids
  end

  test 'should be raise an error if there are no records in a table' do
    Category.destroy_all
    assert_raises ActiveRecord::RecordInvalid do
      SmartSeeds.plant(Entity)
    end
  end

  test 'should be set correctly foreign_key' do
    entity = SmartSeeds.plant(Entity)
    assert_includes @categories_ids, entity.category_id
  end
end
