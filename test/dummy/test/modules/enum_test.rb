require 'test_helper'

class GeneratorTest < ActiveSupport::TestCase
  setup do
    @enums_values = Entity.defined_enums['status'].keys
  end

  test 'should be default value in enum field' do
    entity = SmartSeeds.plant(Entity)
    assert_includes @enums_values, entity.status
  end

  test 'custom values for enum' do
    entity = SmartSeeds.plant(Entity, {status: 'in_progress'})
    assert_equal entity.status, 'in_progress'
  end
end