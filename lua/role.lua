local function rank_map(hand)
  local map = {}
  
  for _, card in pairs(hand) do
    if map[card.rank] then
      map[card.rank] = map[card.rank] + 1
    else
      map[card.rank] = 1
    end
  end

  return map
end

local function suit_map(hand)
  local map = {}

  for _, card = pairs(hand) do
    if map[card.suit] then
      map[card.suit] = map[card.suit] + 1
    else
      map[card.suit] = 1
    end
  end
end

local function is_loyal_straight_flush(hand)

end

local function is_straight_flush(cards)
  return is_straight(hand) and is_flush(hand)
end

-- 最大値と最小値の差分が4 and 重複していない
local function is_straight(hand)
  local max = math.max(table.unpack(hand.ranks))
  local min = math.min(table.unpack(hand.ranks))

  local noDupSize = #rank_map(hand) == 5

  if (max - min == 4) and noDupSize then
    return true
  end

  return false
end

local function is_flush(hand)
  return #suit_map(hand) == 1
end

local function is_straight_flush(cards)
  return is_straight(hand) and is_flush(hand)
end

local function role(cards)
  return "役の名前"
end

return role