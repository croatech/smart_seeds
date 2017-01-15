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

class EntityTest < ActiveSupport::TestCase
  def setup
    #@entity = entites(:one)
  end

  test 'after seeding model shouldnt has fields with nil' do
    SmartSeeds.(Entity)
    entity = Entity.last
    assert_not_nil entity.binary_data
    assert_not_nil entity.boolean_data
    assert_not_nil entity.date_data
    assert_not_nil entity.datetime_data
    assert_not_nil entity.decimal_data
    assert_not_nil entity.float_data
    assert_not_nil entity.integer_data
    assert_not_nil entity.string_data
    assert_not_nil entity.text_data
    assert_not_nil entity.time_data
  end

  test 'should override default attributes' do
    SmartSeeds.(Entity, {string_data:'custom data'})
    entity = Entity.last
    assert_equal entity.string_data, 'custom data'
  end
end
