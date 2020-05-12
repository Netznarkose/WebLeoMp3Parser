class CreateEntries < ActiveRecord::Migration[4.2]
  def change
    create_table :entries do |t|
      t.string :term
      t.string :language
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
