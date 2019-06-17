desc "Create JSON Files"
require 'json'
task :create_json_files => :environment do
  
  cards = Card.all
  cards = cards.as_json
  File.open("public/card_lists/full_card_list.json", "w") do |f|
    f.write(JSON.pretty_generate(cards))
  end

  cards = Card.where(is_maverick: false)
  cards = cards.as_json
  File.open("public/card_lists/standard_cards.json", "w") do |f|
    f.write(JSON.pretty_generate(cards))
  end

  cards = Card.where(is_maverick: true)
  cards = cards.as_json
  File.open("public/card_lists/all_mavericks.json", "w") do |f|
    f.write(JSON.pretty_generate(cards))
  end

end