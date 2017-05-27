require 'test_helper'

class EnumTest < ActiveSupport::TestCase
  setup do
    @enums_values = Entity.defined_enums['status'].keys
    SmartSeeds.plant(Category)
    SmartSeeds.plant(BigCategory)
  end

  test 'should be default value in enum field' do
    SmartSeeds.plant(Entity)
    entity = Entity.last
    assert_includes @enums_values, entity.status
  end

  test 'custom values for enum' do
    SmartSeeds.plant(Entity, {status: 'in_progress'})
    entity = Entity.last
    assert_equal entity.status, 'in_progress'
  end
end
