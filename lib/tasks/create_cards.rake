desc "Create Cards"
require 'net/http'
require 'json'
task :create_cards => :environment do
  # Get the total number of pages of decks
  uri = URI("https://www.keyforgegame.com/api/decks/")
  response = Net::HTTP.get(URI(uri))
  json = JSON.parse(response)
  deck_count = json["count"]

  # Set variables
  page_number = 1
  page_size = 25 # 25 is the max page size
  page_limit = deck_count / 25
  card_list = Card.where(is_maverick: false)

  # Updates Card List (non-mavericks) - there are 370 cards so we stop when we have that many
  # example uri: https://www.keyforgegame.com/api/decks/?page=1&page_size=30&search=&links=cards
  puts "Updating Card List..."
  until page_number > page_limit || Card.where(is_maverick: false).length == 370
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

    puts "#{page_number}/#{page_limit} - Cards: #{Card.where(is_maverick: false).length}"
    page_number = (page_number + 1)
  end
end