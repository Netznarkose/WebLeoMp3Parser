class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :term
      t.string :language
      t.string :url

      t.timestamps null: false
    end
  end
end
