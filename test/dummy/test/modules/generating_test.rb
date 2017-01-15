require 'test_helper'

class GeneratingTest < ActiveSupport::TestCase
  include Generating

  test 'generating available types should be an array' do
    types = Generating::AVAILABLE_TYPES
    assert_instance_of Array, types
  end

  test 'should be an ArgumentError if an argument isn\'t includes in avaliable types' do
    assert_raises(ArgumentError) { Generating.generate_value(:hallo) }
  end

  test 'should generate binary type' do
    value = Generating.generate_value(:binary)
    assert_equal '0b100', value
  end

  test 'should generate boolean type' do
    value = Generating.generate_value(:boolean)
    assert_includes [true, false], value
  end

  test 'should generate date type' do
    value = Generating.generate_value(:date)
    assert_instance_of Date, value
  end

  test 'should generate datetime type' do
    value = Generating.generate_value(:datetime)
    assert_instance_of DateTime, value
  end

  test 'should generate decimal type' do
    value = Generating.generate_value(:decimal)
    assert_instance_of Float, value
  end

  test 'should generate float type' do
    value = Generating.generate_value(:float)
    assert_instance_of Float, value
  end

  test 'should generate integer type' do
    value = Generating.generate_value(:integer)
    assert_instance_of Fixnum, value
  end

  test 'should generate string type' do
    value = Generating.generate_value(:string)
    assert_instance_of String, value
  end

  test 'should generate text type' do
    value = Generating.generate_value(:text)
    assert_instance_of String, value
  end

  test 'should generate time type' do
    value = Generating.generate_value(:time)
    assert_instance_of Time, value
  end
end
