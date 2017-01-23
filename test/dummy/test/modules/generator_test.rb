# Table name: entities
#
#  id            :integer          not null, primary key
#  binary_data   :binary
#  boolean_data  :boolean
#  date_data     :date
#  datetime_data :datetime
#  decimal_data  :decimal(, )
#  float_data    :float
#  integer_data  :integer
#  string_data   :string
#  text_data     :text
#  time_data     :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null

require 'test_helper'
require_relative '../helpers/column_helper'

class GeneratorTest < ActiveSupport::TestCase
  include ColumnHelper

  setup do
    SmartSeeds.plant(Category)
  end

  test 'should generate binary type' do
    column = get_column_by_name('binary_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_equal '0b100', value
  end

  test 'should generate boolean type' do
    column = get_column_by_name('boolean_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_includes [true, false], value
  end

  test 'should generate date type' do
    column = get_column_by_name('date_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Date, value
  end

  test 'should generate datetime type' do
    column = get_column_by_name('datetime_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of DateTime, value
  end

  test 'should generate decimal type' do
    column = get_column_by_name('decimal_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Float, value
  end

  test 'should generate float type' do
    column = get_column_by_name('float_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Float, value
  end

  test 'should generate integer type' do
    column = get_column_by_name('integer_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Fixnum, value
  end

  test 'should generate string type' do
    column = get_column_by_name('string_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of String, value
  end

  test 'should generate text type' do
    column = get_column_by_name('text_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of String, value
  end

  test 'should generate time type' do
    column = get_column_by_name('time_data', Entity)
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Time, value
  end

  test 'id name must be skipped by default and not generated' do
    # difference between of ids of two continuously created objects must be equal 1
    entity = SmartSeeds.plant(Entity)
    assert_equal entity.id, 1
  end

  test 'id must be generated if client sends a custom value in the hash' do
    entity_1 = SmartSeeds.plant(Entity, {id: 666})
    assert_equal entity_1.id, 666
  end

  test 'created_at name must be skipped by default and generated current date' do
    # difference between of ids of two continuously created objects must be equal 1
    entity = SmartSeeds.plant(Entity)
    assert_equal entity.created_at.to_i, DateTime.now.to_i
  end

  test 'created_at must be generated if client sends a custom value in the hash' do
    entity = SmartSeeds.plant(Entity, {created_at: DateTime.tomorrow})
    assert_equal entity.created_at, DateTime.tomorrow
  end

  test 'updated_at name must be skipped by default and generated current date' do
    # difference between of ids of two continuously created objects must be equal 1
    entity = SmartSeeds.plant(Entity)
    assert_equal entity.updated_at.to_i, DateTime.now.to_i
  end

  test 'updated_at must be generated if client sends a custom value in the hash' do
    entity = SmartSeeds.plant(Entity, {updated_at: DateTime.tomorrow})
    assert_equal entity.updated_at, DateTime.tomorrow
  end
end
