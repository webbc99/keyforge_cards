class AddCardsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :cards
    create_table :cards do |t|
      t.string :card_id
      t.integer :amber
      t.integer :armor
      t.integer :card_number
      t.string :card_text
      t.string :card_title
      t.string :card_type
      t.integer :expansion
      t.string :flavor_text
      t.string :front_image
      t.string :house
      t.boolean :is_maverick
      t.integer :power
      t.string :rarity
      t.string :traits

      t.timestamps
    end
    add_index :cards, :card_id, unique: true
  end
end
