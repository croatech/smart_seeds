# == Schema Information
#
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
#

class Entity < ApplicationRecord
  enum status: %i(active in_progress archived)
end
