module SmartSeeds
  module Generator
    class Float < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        rand(6.6...6666.0).round(2)
      end
    end
  end
end