class CreateMoviesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :movies_tables do |t|
      t.column :title, :string
      t.column :genre, :string
      t.timestamps
    end
  end
end
