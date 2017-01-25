require 'test_helper'

class ForeignKeyTest < ActiveSupport::TestCase
  setup do
    SmartSeeds.plant(Category)
    SmartSeeds.plant(Category)
    SmartSeeds.plant(BigCategory)
    SmartSeeds.plant(BigCategory)
  end

  test 'should be raise an error if there are no records in a table' do
    Category.destroy_all
    BigCategory.destroy_all

    assert_raises ActiveRecord::RecordInvalid do
      SmartSeeds.plant(Entity)
    end
  end

  test 'should be set a correctly foreign_key' do
    categories_ids = Category.ids
    entity = SmartSeeds.plant(Entity)
    assert_includes categories_ids, entity.category_id
  end

  test 'should be set a correctly foreign_key with two words in class name' do
    big_categories_ids = BigCategory.ids
    entity = SmartSeeds.plant(Entity)
    assert_includes big_categories_ids, entity.big_category_id
  end
end
