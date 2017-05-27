module SmartSeeds
  module Generator
    class Integer < SmartSeeds::Generator::Base
      def initialize(column, model)
        super
      end

      def generate_value
        if enum?
          generate_enum
        elsif foreign_key?
          generate_foreign_key
        else
          rand(1..66666)
        end
      end

      private

      def enum?
        SmartSeeds::Generator::Enum.new(column, model).enum?
      end

      def generate_enum
        SmartSeeds::Generator::Enum.new(column, model).generate_value
      end

      def foreign_key?
        SmartSeeds::Generator::ForeignKey.new(column, model).foreign_key?
      end

      def generate_foreign_key
        SmartSeeds::Generator::ForeignKey.new(column, model).generate_value
      end
    end
  end
end