module SmartSeeds
  module Generator
    class Base
      attr_reader :column_type

      AVAILABLE_TYPES = %i(
                           binary
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

      def initialize(column_type)
        @column_type = column_type
      end

      def generate_value
        raise ArgumentError, "There is no column type #{column_type}" unless SmartSeeds::Generator::Base::AVAILABLE_TYPES.include?(column_type)

        klass = "SmartSeeds::Generator::#{column_type.to_s.capitalize}".constantize
        klass.new(column_type).generate_value
      end
    end
  end
end