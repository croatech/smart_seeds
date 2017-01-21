module SmartSeeds
  module Generator
    class Base
      # Available types of AR model(:binary, :boolean, etc.)
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

      def initialize(column, model)
        @column = column
        @model = model
      end

      def generate_value
        begin
          klass = "SmartSeeds::Generator::#{column.type.to_s.capitalize}".constantize
          klass.new(column, model).generate_value
        rescue Exception => e
          puts e.inspect
        end
      end

      protected

      attr_reader :column, :model
    end
  end
end