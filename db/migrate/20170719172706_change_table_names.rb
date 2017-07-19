class ChangeTableNames < ActiveRecord::Migration[5.1]
  def change
    rename_table :movies_tables, :movies
    rename_table :quotes_tables, :quotes
  end
end
