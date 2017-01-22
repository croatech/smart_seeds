module SmartSeeds
  module Generator
    class String < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        ::Faker::Lorem.word
      end
    end
  end
end