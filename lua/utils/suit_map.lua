local function suit_map(cards)
  local map = {}

  for _, card in pairs(cards) do
    if map[card.suit] then
      map[card.suit] = map[card.suit] + 1
    else
      map[card.suit] = 1
    end
  end

  return map
end

return suit_map
