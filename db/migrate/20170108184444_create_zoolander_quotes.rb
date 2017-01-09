class CreateZoolanderQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :zoolander_quotes do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
