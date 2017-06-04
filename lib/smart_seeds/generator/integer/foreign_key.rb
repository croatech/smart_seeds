module SmartSeeds
  module Generator
    class ForeignKey < SmartSeeds::Generator::Integer
      include ActiveSupport::Inflector

      def initialize(column, model)
        super
      end

      def generate_value
        klass = determine_klass

        if klass.ids.empty?
          raise ActiveRecord::ActiveRecordError,
                "There are no records in #{camelized_model_name}. You have to add those first. You can run SmartSeeds.plant(#{camelized_model_name})"
        else
          klass.ids.sample
        end
      end

      def foreign_key?
        true if associations_include_column?
      end

      private

      def determine_klass
        assocation = model_associations.select { |obj| obj.name == column_name_without_id.to_sym }

        # if a class_name has been overrided in a model's class
        if assocation.first.options.key? :class_name
          assocation.first.options[:class_name].constantize
        else
          camelized_model_name
        end
      end

      def model_associations
        model.reflect_on_all_associations(:belongs_to)
      end

      def column_name_without_id
        column.name.sub(/^*_id/, '')
      end

      def associations_include_column?
        model_associations.map(&:name).include?(column_name_without_id.to_sym)
      end

      def camelized_model_name
        # converts underscore words like big_category to BigCategory constant
        camelize(column_name_without_id).constantize
      end
    end
  end
end