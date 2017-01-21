require 'test_helper'

class GeneratorTest < ActiveSupport::TestCase
  setup do
    @enums_values = Entity.defined_enums['status'].keys
  end

  test 'should be default value in enum field' do
    entity = SmartSeeds.(Entity)
    assert_includes(@enums_values, entity.status)
  end
end
