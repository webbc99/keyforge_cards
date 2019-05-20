class Card < ApplicationRecord

  def new(args)
    @card_id = args["id"],
    @card_title = args["card_title"],
    @house = args["house"],
    @card_type = args["card_type"],
    @front_image = args["front_image"],
    @card_text = args["card_text"],
    @traits = args["traits"],
    @amber = args["amber"],
    @power = args["power"],
    @armor = args["armor"],
    @rarity = args["rarity"],
    @flavor_text = args["flavor_text"],
    @card_number = args["card_number"],
    @expansion = args["expansion"],
    @is_maverick = args["is_maverick"]
  end

end
