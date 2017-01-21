module SmartSeeds
  module Generator
    class Enum < SmartSeeds::Generator::Integer
      def initialize(column, model)
        super
      end

      def generate_value
        # Extract all values from enum hash
        # {"status"=>{"active"=>0, "in_progress"=>1, "archived"=>2}}
        # Get [0, 1, 2]
        values_array = model.defined_enums[column.name].values
        values_array.sample
      end

      def is_enum?
        model.defined_enums.include?(column.name)
      end
    end
  end
end