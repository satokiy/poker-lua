Card = {}
Card.new = function(card)
  return {
    rank = card:sub(2),
    suit = card:sub(1, 1)
  }
end

local function create_card(card)
  return Card.new(card)
end

local card_module = {
  Card = Card,
  create_card = create_card
}

return card_module
