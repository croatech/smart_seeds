module SmartSeeds
  module Generator
    class Date < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        ::DateTime.now.to_date
      end
    end
  end
end