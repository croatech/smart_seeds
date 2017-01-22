module SmartSeeds
  module Generator
    class Integer < SmartSeeds::Generator::Base
      def initialize(column, model)
        super
      end

      def generate_value
        if is_an_enum?
          generate_enum
        elsif is_foreign_key?
          generate_foreign_key
        else
          rand(1..66666)
        end
      end

      private

      def is_an_enum?
        SmartSeeds::Generator::Enum.new(column, model).is_an_enum?
      end

      def generate_enum
        SmartSeeds::Generator::Enum.new(column, model).generate_value
      end

      def is_foreign_key?
        SmartSeeds::Generator::ForeignKey.new(column, model).is_a_foreign_key?
      end

      def generate_foreign_key
        SmartSeeds::Generator::ForeignKey.new(column, model).generate_value
      end
    end
  end
end