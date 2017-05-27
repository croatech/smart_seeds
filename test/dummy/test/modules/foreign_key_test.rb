require 'test_helper'

class ForeignKeyTest < ActiveSupport::TestCase
  setup do
    SmartSeeds.plant(Category)
    SmartSeeds.plant(Category)
    SmartSeeds.plant(BigCategory)
    SmartSeeds.plant(BigCategory)
    SmartSeeds.plant(Entity)
    @entity = Entity.last
    @categories_ids = Category.ids
  end

  test 'should be raise an error if there are no records in a table' do
    Category.destroy_all
    BigCategory.destroy_all

    error = assert_raises ActiveRecord::ActiveRecordError do
      SmartSeeds.plant(Entity)
    end
    assert_match /There are no records in/, error.message
  end

  test 'should be set a correctly foreign_key' do
    assert_includes @categories_ids, @entity.category_id
  end

  test 'should be set a correctly foreign_key with two words in class name' do
    big_categories_ids = BigCategory.ids
    assert_includes big_categories_ids, @entity.big_category_id
  end

  test 'should be set a correctly foreign_key if it refers to not default class_name' do
    assert_includes @categories_ids, @entity.custom_category_id
  end
end
