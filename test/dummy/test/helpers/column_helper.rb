module ColumnHelper
  def get_column_by_name(column_name, model)
    model.columns.find { |column| column.name == column_name }
  end
end