require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    fill_in "Amber", with: @card.amber
    fill_in "Armor", with: @card.armor
    fill_in "Card number", with: @card.card_number
    fill_in "Card text", with: @card.card_text
    fill_in "Card title", with: @card.card_title
    fill_in "Card type", with: @card.card_type
    fill_in "Expansion", with: @card.expansion
    fill_in "Flavor text", with: @card.flavor_text
    fill_in "Front image", with: @card.front_image
    fill_in "House", with: @card.house
    fill_in "Id", with: @card.id
    fill_in "Is maverick", with: @card.is_maverick
    fill_in "Power", with: @card.power
    fill_in "Rarity", with: @card.rarity
    fill_in "Traits", with: @card.traits
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first

    fill_in "Amber", with: @card.amber
    fill_in "Armor", with: @card.armor
    fill_in "Card number", with: @card.card_number
    fill_in "Card text", with: @card.card_text
    fill_in "Card title", with: @card.card_title
    fill_in "Card type", with: @card.card_type
    fill_in "Expansion", with: @card.expansion
    fill_in "Flavor text", with: @card.flavor_text
    fill_in "Front image", with: @card.front_image
    fill_in "House", with: @card.house
    fill_in "Id", with: @card.id
    fill_in "Is maverick", with: @card.is_maverick
    fill_in "Power", with: @card.power
    fill_in "Rarity", with: @card.rarity
    fill_in "Traits", with: @card.traits
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
