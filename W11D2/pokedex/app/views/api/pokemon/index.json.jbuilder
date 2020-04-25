

@pokemon.each do |pokemon|
  json.set! pokemon.id do
    json.extract! pokemon, :id, :name, :image_url # instance variables that live in pokemon
    json.image_url asset_path("pokemon_snaps/#{pokemon.image_url}")
    # asset_path starts off in app/assets/images
  end
end