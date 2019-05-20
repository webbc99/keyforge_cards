require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { amber: @card.amber, armor: @card.armor, card_number: @card.card_number, card_text: @card.card_text, card_title: @card.card_title, card_type: @card.card_type, expansion: @card.expansion, flavor_text: @card.flavor_text, front_image: @card.front_image, house: @card.house, id: @card.id, is_maverick: @card.is_maverick, power: @card.power, rarity: @card.rarity, traits: @card.traits } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { amber: @card.amber, armor: @card.armor, card_number: @card.card_number, card_text: @card.card_text, card_title: @card.card_title, card_type: @card.card_type, expansion: @card.expansion, flavor_text: @card.flavor_text, front_image: @card.front_image, house: @card.house, id: @card.id, is_maverick: @card.is_maverick, power: @card.power, rarity: @card.rarity, traits: @card.traits } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
