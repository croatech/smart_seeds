require 'test_helper'

# Tests for defaults and custom values and behavior

class DefaultsTest < ActiveSupport::TestCase
  setup do
    SmartSeeds.plant(Category)
    SmartSeeds.plant(BigCategory)
    @entity = SmartSeeds.plant(Entity)
  end

  test 'id name must be skipped by default and not generated' do
    # difference between of ids of two continuously created objects must be equal 1
    last_entity = @entity
    new_entity = SmartSeeds.plant(Entity)
    assert_equal new_entity.id, last_entity.id + 1
  end

  test 'id must be generated if client sends a custom value in the hash' do
    entity = SmartSeeds.plant(Entity, {id: 666})
    assert_equal entity.id, 666
  end

  test 'created_at name must be skipped by default and generated current date' do
    assert_equal @entity.created_at.to_i, DateTime.now.to_i
  end

  test 'created_at must be generated if client sends a custom value in the hash' do
    entity = SmartSeeds.plant(Entity, {created_at: DateTime.tomorrow})
    assert_equal entity.created_at, DateTime.tomorrow
  end

  test 'updated_at name must be skipped by default and generated current date' do
    assert_equal @entity.updated_at.to_i, DateTime.now.to_i
  end

  test 'updated_at must be generated if client sends a custom value in the hash' do
    entity = SmartSeeds.plant(Entity, {updated_at: DateTime.tomorrow})
    assert_equal entity.updated_at, DateTime.tomorrow
  end

  test 'default values in AR model must be skipped' do
    # default values for Entity are :default_integer(1) and :default_boolean(true)
    assert_equal @entity.default_integer, 1
    assert_equal @entity.default_boolean, true
  end
9
  test 'default values in AR model must be override if cliens sends a custom value' do
    entity = SmartSeeds.plant(Entity, {default_integer: 6, default_boolean: false})
    assert_equal entity.default_integer, 6
    assert_equal entity.default_boolean, false
  end

  test 'should raise error if attributes doesnt exist' do
    assert_raises(ActiveModel::MissingAttributeError) do
      SmartSeeds.plant(Entity, {unknown_attribute: 'Trees of eternity'})
    end
  end
end