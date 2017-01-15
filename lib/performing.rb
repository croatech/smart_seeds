class Performing
  def initialize(model)
    @ignored_attrs = %w(id created_at updated_at)
    @model = model
    @object = model.new
  end

  def call
    model.columns.each do |column|
      column_name = column.name
      column_type = column.type

      next if is_column_must_be_skipped?(column_name)

      object[column_name] = generate_value(column_type)
    end

    object.save!
  end

  private

  attr_reader :ignored_attrs
  attr_reader :model
  attr_reader :object

  def is_column_must_be_skipped?(column_name)
    #byebug
    ignored_attrs.include? column_name
  end

  def generate_value(column_type)
    Generating.generate_value(column_type)
  end
end