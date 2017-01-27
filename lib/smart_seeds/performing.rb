module SmartSeeds
  class Performing
    SKIPPABLE_COLUMN_NAMES = %w(id created_at updated_at)

    def initialize(model, attrs)
      @attrs = attrs
      @model = model
      @object = model.new
    end

    def start
      set_default_values

      # User can send custom values in a hash: SmartSeeds.(Entity, {name: 'Aleah'})
      # This method overrides default values to custom('name' in the example above)
      set_custom_values if attrs.any?

      object.save!
      object
    end

    private

    attr_reader :attrs, :model, :object

    def set_default_values
      model.columns.each do |column|
        next if is_column_must_be_skipped?(column.name)

        object[column.name] = generate_value(column)
      end
    end

    def set_custom_values
      attrs.each do |attr|
        key = attr.first
        value = attr.last
        object[key.to_s] = value
      end
    end

    # There are generator classes for each type of columns
    # If model's type is :integer, method below delegates to SmartSeeds::Generator::Integer
    def generate_value(column)
      klass = "SmartSeeds::Generator::#{column.type.to_s.capitalize}".constantize
      klass.new(column, model).generate_value
    end

    def is_column_must_be_skipped?(column_name)
      SmartSeeds::Performing::SKIPPABLE_COLUMN_NAMES.include?(column_name)
    end
  end
end