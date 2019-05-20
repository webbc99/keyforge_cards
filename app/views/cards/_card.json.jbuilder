json.extract! card, :id, :card_id, :amber, :armor, :card_number, :card_text, :card_title, :card_type, :expansion, :flavor_text, :front_image, :house, :is_maverick, :power, :rarity, :traits, :created_at, :updated_at
json.url card_url(card, format: :json)
