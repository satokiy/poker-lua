local function rank_map(cards)
  local map = {}
  
  for _, card in pairs(cards) do
    if map[card.rank] then
      map[card.rank] = map[card.rank] + 1
    else
      map[card.rank] = 1
    end
  end

  return map
end

return rank_map
