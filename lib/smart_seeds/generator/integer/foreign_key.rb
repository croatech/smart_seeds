module SmartSeeds
  module Generator
    class ForeignKey < SmartSeeds::Generator::Integer
      def initialize(column, model)
        super
      end

      def generate_value
        klass = convert_column_name.constantize
        klass.ids.sample
      end

      def is_a_foreign_key?
        true if splitted_column_name.last == 'id'
      end

      private

      def convert_column_name
        # If a foreign key contains of two words splitted by dash like super_hero_id(SuperHero model)
        if splitted_column_name.count > 2
          # Pop the last element from an splitted array(_id)
          arr = splitted_column_name.take(splitted_column_name.count - 1)
          arr.map(&:capitalize).join
        # Or it can be just a hero_id(Hero model)
        else
          splitted_column_name.first.capitalize
        end
      end

      def splitted_column_name
        column.name.split('_')
      end
    end
  end
end