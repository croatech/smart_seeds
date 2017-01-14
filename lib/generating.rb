module Generating
  AVAILABLE_TYPES = %i(binary
                       boolean
                       date
                       datetime
                       decimal
                       float
                       integer
                       string
                       text
                       time
                     )

  def self.generate_value(column_type)
    raise ArgumentError, "There is no column type #{column_type}" unless Generating::AVAILABLE_TYPES.include?(column_type)
  end
end