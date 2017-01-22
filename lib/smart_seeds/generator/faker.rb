module SmartSeeds
  module Generator
    class Faker < SmartSeeds::Generator::Base
      def initialize(column, model)
        super
      end

      def generate_value
        raise NotCompatibleWithFaker unless is_compatible?
      end

      private

      def is_compatible?
        true if faker_classes.includes?(model.name.to_sym) && faker_methods_in_the_class.include?(column.name.to_sym)
      end

      def faker_classes
        Faker.constants.select {|c| Faker.const_get(c).is_a? Class}
      end

      def faker_methods_in_the_class
        # Extract all singleton generate methods from Faker except supports
        support_methods = %i(method_missing fetch translate parse with_locale unique numerify letterify bothify regexify fetch_all flexible rand_in_range yaml_tag)
        klass = "Faker::#{model.name.capitalize}".constantize

        # If it's a Superhero class should stay only these methods below
        # => [:name, :prefix, :suffix, :power, :descriptor]
        klass.singleton_methods - support_methods
      end
    end
  end
end