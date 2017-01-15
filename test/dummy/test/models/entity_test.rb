require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  def setup
    #@entity = entites(:one)
  end

  test 'should be an empty Entity table' do
    assert_empty(Entity.all)
  end

  test 'should '
end
