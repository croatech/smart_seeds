module SmartSeeds
  module Generator
    class Integer < SmartSeeds::Generator::Base
      def initialize(column, model)
        super
      end

      def generate_value
        enum = SmartSeeds::Generator::Enum.new(column, model)
        foreign_key = SmartSeeds::Generator::ForeignKey.new(column, model)

        if enum.enum?
          enum.generate_value
        elsif foreign_key.foreign_key?
          foreign_key.generate_value
        else
          rand(1..66666)
        end
      end
    end
  end
end