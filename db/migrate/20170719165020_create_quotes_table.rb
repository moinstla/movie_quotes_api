class CreateQuotesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes_tables do |t|
      t.column :character, :string
      t.column :content, :string
      t.column :movie_id, :integer
      t.timestamps
    end
  end
end
