require 'test_helper'

class GeneratingTest < ActiveSupport::TestCase
  test 'generating available types should be an array' do
    types = SmartSeeds::Generator::Base::AVAILABLE_TYPES
    assert_instance_of Array, types
  end

  test 'should generate binary type' do
    column = Entity.columns.find { |obj| obj.type == :binary }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_equal '0b100', value
  end

  test 'should generate boolean type' do
    column = Entity.columns.find { |obj| obj.type == :boolean }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_includes [true, false], value
  end

  test 'should generate date type' do
    column = Entity.columns.find { |obj| obj.type == :date }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Date, value
  end

  test 'should generate datetime type' do
    column = Entity.columns.find { |obj| obj.type == :datetime }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of DateTime, value
  end

  test 'should generate decimal type' do
    column = Entity.columns.find { |obj| obj.type == :decimal }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Float, value
  end

  test 'should generate float type' do
    column = Entity.columns.find { |obj| obj.type == :float }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Float, value
  end

  test 'should generate integer type' do
    column = Entity.columns.find { |obj| obj.type == :integer }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Fixnum, value
  end

  test 'should generate string type' do
    column = Entity.columns.find { |obj| obj.type == :string }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of String, value
  end

  test 'should generate text type' do
    column = Entity.columns.find { |obj| obj.type == :text }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of String, value
  end

  test 'should generate time type' do
    column = Entity.columns.find { |obj| obj.type == :time }
    value = SmartSeeds::Generator::Base.new(column, Entity).generate_value
    assert_instance_of Time, value
  end
end
