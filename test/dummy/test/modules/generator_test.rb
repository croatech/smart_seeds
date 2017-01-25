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
    SmartSeeds.plant(BigCategory)
    @entity = SmartSeeds.plant(Entity)
  end

  test 'should generate binary type' do
    assert_equal '0b100', @entity.binary_data
  end

  test 'should generate boolean type' do
    assert_includes [true, false], @entity.boolean_data
  end

  test 'should generate date type' do
    assert_instance_of Date, @entity.date_data
  end

  test 'should generate datetime type' do
    assert_instance_of DateTime, @entity.datetime_data.to_datetime
  end

  test 'should generate decimal type' do
    assert_instance_of BigDecimal, @entity.decimal_data
  end

  test 'should generate float type' do
    assert_instance_of Float, @entity.float_data
  end

  test 'should generate integer type' do
    assert_instance_of Fixnum, @entity.integer_data
  end

  test 'should generate string type' do
    assert_instance_of String, @entity.string_data
  end

  test 'string data should be capitalized' do
    assert @entity.string_data.capitalize
  end

  test 'should generate text type' do
    assert_instance_of String, @entity.text_data
  end

  test 'should generate time type' do
    assert_instance_of Time, @entity.time_data.to_time
  end

  test 'id name must be skipped by default and not generated' do
    # difference between of ids of two continuously created objects must be equal 1
    last_entity = Entity.last
    entity = SmartSeeds.plant(Entity)
    assert_equal entity.id, last_entity.id + 1
  end

  test 'id must be generated if client sends a custom value in the hash' do
    entity = SmartSeeds.plant(Entity, {id: 666})
    assert_equal entity.id, 666
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
