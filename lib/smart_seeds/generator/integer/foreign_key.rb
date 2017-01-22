module SmartSeeds
  module Generator
    class ForeignKey < SmartSeeds::Generator::Integer
      def initialize(column, model)
        super
      end

      def generate_value
        klass = column.name.split('_').first.capitalize.constantize
        klass.ids.sample
      end

      def is_a_foreign_key?
        true if column.name.split('_').last == 'id'
      end
    end
  end
end