desc "Check For Maverick Cards"
require 'net/http'
require 'json'
task :check_for_maverick_cards => :environment do
  # Get the total number of pages of decks
  uri = URI("https://www.keyforgegame.com/api/decks/")
  response = Net::HTTP.get(URI(uri))
  json = JSON.parse(response)
  deck_count = json["count"]

  # Set variables
  page_number = 1
  page_size = 25 # 25 is the max page size
  page_limit = deck_count / 25
  full_card_list = Card.all

  # Updates FULL Card List including all registered Mavericks - NOTE: this takes hours to run
  # example uri: https://www.keyforgegame.com/api/decks/?page=1&page_size=30&search=&links=cards
  puts "Updating FULL Card List..."
  until page_number > page_limit
    uri = URI("https://www.keyforgegame.com/api/decks/?page=#{page_number}&page_size=#{page_size}&search=&links=cards")
    response = Net::HTTP.get(URI(uri))
    json = JSON.parse(response)

    cards = json["_linked"]["cards"]
    cards.each do |card|
      unless Card.exists?(:card_id => card["id"])
        Card.create({
        card_id: card["id"],
        amber: card["amber"],
        card_number: card["card_number"],
        card_text: card["card_text"],
        card_title: card["card_title"],
        card_type: card["card_type"],
        expansion: card["expansion"],
        flavor_text: card["flavor_text"],
        front_image: card["front_image"],
        house: card["house"],
        is_maverick: card["is_maverick"],
        power: card["power"],
        rarity: card["rarity"],
        traits: card["traits"],
        })
      end
    end

    puts "#{page_number}/#{page_limit} - Cards: #{Card.all.length}"
    page_number = (page_number + 1)
  end
end