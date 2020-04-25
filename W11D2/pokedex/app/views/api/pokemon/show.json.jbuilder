json.pokemon do 
  json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :moves
  json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end

json.items do 
  @pokemon.items.each do |item|
    json.set! item.id do 
      json.extract! item, :id, :name, :price, :happiness, :image_url
    end
  end
end

# {
# "id": 5,
# "name": "Charmeleon",
# "attack": 64,
# "defense": 58,
# "poke_type": "fire",
# "moves": [
# "scratch",
# "ember",
# "metal claw",
# "flamethrower"
# ],
# "image_url": "/assets/pokemon_snaps/5-b47514f3eb8f165ebf18df794acd63f595d5177a32c9233f862741b2d1d95454.svg"
# }