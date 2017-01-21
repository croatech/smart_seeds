module SmartSeeds
  module Generator
    class Text < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        Faker::Lorem.paragraph
      end
    end
  end
end