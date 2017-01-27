module SmartSeeds
  module Generator
    class Text < SmartSeeds::Generator::Base

      def initialize(column, model)
        super
      end

      def generate_value
        if is_comatible_with_faker?
          generate_faker_value
        else
          ::Faker::Lorem.paragraph
        end
      end
    end
  end
end