module SmartSeeds
  module Generator
    class String < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        if is_comatible_with_faker?
          generate_faker_value
        else
          ::Faker::Lorem.word.capitalize
        end
      end
    end
  end
end