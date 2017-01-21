module SmartSeeds
  module Generator
    class Integer < SmartSeeds::Generator::Base

      def initialize(column_type)
        super
      end

      def generate_value
        rand(1..666)
      end
    end
  end
end