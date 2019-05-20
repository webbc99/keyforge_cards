class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :deck_id
      t.timestamps
    end
    add_index :decks, :deck_id, unique: true
  end
end
