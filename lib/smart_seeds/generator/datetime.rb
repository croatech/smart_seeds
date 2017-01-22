module SmartSeeds
  module Generator
    class Datetime < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        DateTime.now
      end
    end
  end
end