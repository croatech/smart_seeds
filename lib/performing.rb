class Performing
  ignored_attrs = %w(id created_at updated_at)
  attr_reader :ignored_attrs

  attr_reader :model
  attr_reader :object
  #attr_reader :acessible_attrs

  def initialize(model)
    @model = model
    @object = model.new
    #@acessible_attrs = model.columns.map(&:name) - ignored_attrs

  end

  def call
    model.columns.each do |column|
      column_name = column.name
      column_type = column.type

      next if is_column_should_be_skipped?(column_name)

      object[column_name] = generate_value(column_type)
    end
  end

  private

  def is_column_should_be_skipped?(column_name)
    ignored_attrs.include? column_name
  end

  def generate_value(column_type)
    Generating.generate_value(column_type)
  end
end