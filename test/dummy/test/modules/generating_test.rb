require 'test_helper'

class GeneratingTest < ActiveSupport::TestCase
  test 'generating available types should be an array' do
    types = SmartSeeds::Generator::Base::AVAILABLE_TYPES
    assert_instance_of Array, types
  end

  test 'should be an ArgumentError if an argument isn\'t includes in avaliable types' do
    assert_raises(ArgumentError) { SmartSeeds::Generator::Base.new(:hallo).generate_value }
  end

  test 'should generate binary type' do
    value = SmartSeeds::Generator::Base.new(:binary).generate_value
    assert_equal '0b100', value
  end

  test 'should generate boolean type' do
    value = SmartSeeds::Generator::Base.new(:boolean).generate_value
    assert_includes [true, false], value
  end

  test 'should generate date type' do
    value = SmartSeeds::Generator::Base.new(:date).generate_value
    assert_instance_of Date, value
  end

  test 'should generate datetime type' do
    value = SmartSeeds::Generator::Base.new(:datetime).generate_value
    assert_instance_of DateTime, value
  end

  test 'should generate decimal type' do
    value = SmartSeeds::Generator::Base.new(:decimal).generate_value
    assert_instance_of Float, value
  end

  test 'should generate float type' do
    value = SmartSeeds::Generator::Base.new(:float).generate_value
    assert_instance_of Float, value
  end

  test 'should generate integer type' do
    value = SmartSeeds::Generator::Base.new(:integer).generate_value
    assert_instance_of Fixnum, value
  end

  test 'should generate string type' do
    value = SmartSeeds::Generator::Base.new(:string).generate_value
    assert_instance_of String, value
  end

  test 'should generate text type' do
    value = SmartSeeds::Generator::Base.new(:text).generate_value
    assert_instance_of String, value
  end

  test 'should generate time type' do
    value = SmartSeeds::Generator::Base.new(:time).generate_value
    assert_instance_of Time, value
  end
end
