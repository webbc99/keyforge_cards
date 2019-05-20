class DropDecks < ActiveRecord::Migration[5.2]
  def change
    drop_table :decks
  end
end
