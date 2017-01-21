module SmartSeeds
  module Generator
    class Binary < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        '0b100'
      end
    end
  end
end