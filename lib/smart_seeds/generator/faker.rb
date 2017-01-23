require 'faker'

module SmartSeeds
  module Generator
    class Faker < SmartSeeds::Generator::Base
      def initialize(column, model)
        super
      end

      def generate_value
        faker_class.send(column.name.to_sym)
      end

      def is_compatible?
        true if faker_classes_include_model_name? && faker_methods_include_column_name?
      end

      private

      def faker_classes_include_model_name?
        # Check if Faker has a Class which called as a AR Model
        faker_classes = ::Faker.constants.select {|c| ::Faker.const_get(c).is_a? Class}
        faker_classes.include? model.name.to_sym
      end

      def faker_methods_include_column_name?
        # Support methods are included in Faker generate class
        support_singleton_methods = %i(method_missing fetch translate parse with_locale unique numerify letterify bothify regexify fetch_all flexible rand_in_range yaml_tag)

        klass = faker_class

        # Here is should stay only methods for generating random values without support methods like:
        # => [:name, :prefix, :suffix, :power, :descriptor]
        faker_methods = klass.singleton_methods - support_singleton_methods
        faker_methods.include? column.name.to_sym
      end

      def faker_class
        "Faker::#{model.name.capitalize}".constantize
      end
    end
  end
end