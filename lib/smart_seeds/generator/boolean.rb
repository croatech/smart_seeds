module SmartSeeds
  module Generator
    class Boolean < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        [true, false].sample
      end
    end
  end
end