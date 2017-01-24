module SmartSeeds
  module Generator
    class Base
      def initialize(column, model)
        @column = column
        @model = model
      end

      def generate_value
        generate_faker_value if is_comatible_with_faker?
      end

      protected

      attr_reader :column, :model

      def is_comatible_with_faker?
        SmartSeeds::Generator::Faker.new(column, model).is_compatible?
      end

      def generate_faker_value
        SmartSeeds::Generator::Faker.new(column, model).generate_value
      end
    end
  end
end