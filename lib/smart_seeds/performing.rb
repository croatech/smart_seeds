module SmartSeeds
  class Performing
    def initialize(model, attrs)
      @attrs = attrs
      @model = model
      @object = model.new
      @skippable_attributes = %w(id created_at updated_at)
    end

    def start
      add_skippable_attributes
      set_default_values

      # User can send custom values in a hash: SmartSeeds.plant(Entity, {name: 'Aleah'})
      # This method overrides default values to custom('name' in the example above)
      set_custom_values if attrs.any?

      object.save!
      object
    end

    private

    attr_reader :attrs, :model, :object, :skippable_attributes

    def add_skippable_attributes
      # All default attributes which defined in AR object should be skipped by default
      keys_with_default_values = model.column_defaults.select{|key, value| value.present? }.keys
      skippable_attributes.concat(keys_with_default_values)
    end

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
      skippable_attributes.include?(column_name)
    end
  end
end
