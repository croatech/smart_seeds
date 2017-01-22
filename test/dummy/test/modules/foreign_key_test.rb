require 'test_helper'

class ForeignKeyTest < ActiveSupport::TestCase
  test 'should be raise an error if there are no records in a table' do
    assert_raises ActiveRecord::RecordInvalid do
      SmartSeeds.plant(Category)
    end
  end

  test 'should be set correctly foreign_key' do
    SmartSeeds.plant(Entity)
    SmartSeeds.plant(Entity)
    SmartSeeds.plant(Entity)
    entites_ids = Entity.ids
    category = SmartSeeds.plant(Category)
    assert_includes entites_ids, category.entity_id
  end
end
