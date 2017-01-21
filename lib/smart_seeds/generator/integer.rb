module SmartSeeds
  module Generator
    class Integer < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        if is_enum?
          generate_enum
        else
          rand(1..66666)
        end
      end

      private

      def is_enum?
        SmartSeeds::Generator::Enum.new(column, model).is_enum?
      end

      def generate_enum
        SmartSeeds::Generator::Enum.new(column, model).generate_value
      end
    end
  end
end