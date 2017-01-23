require 'test_helper'
require_relative '../helpers/column_helper'

class FakerTest < ActiveSupport::TestCase
  include ColumnHelper

  test 'should be false if faker is not compatible' do
    # If Faker hasn't a Class equals Model name and method equals column name
    # Faker hasn't got Entity class
    column = Entity.columns.first
    result = SmartSeeds::Generator::Faker.new(column, Entity).is_compatible?
    assert_not result
  end

  test 'should be true if faker is compatible' do
    # If Faker has a Class equals Model name and method equals column name
    column = get_column_by_name('name', Superhero)
    result = SmartSeeds::Generator::Faker.new(column, Superhero).is_compatible?
    assert result
  end
end
