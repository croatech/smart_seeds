module SmartSeeds
  module Generator
    class Time < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        DateTime.now.to_time
      end
    end
  end
end