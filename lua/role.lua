local rank_map = require "utils/rank_map"
local suit_map = require "utils/suit_map"
local map_size = require "utils/map_size"

local function has_three_card(hand)
  local map = rank_map(hand.cards)

  for _, v in pairs(map) do
    if v == 3 then
      return true
    end
  end

  return false
end

local function has_one_pair(hand)
  local map = rank_map(hand.cards)

  for _, v in pairs(map) do
    if v == 2 then
      return true
    end
  end

  return false
end

-- 最大値と最小値の差分が4 and 重複していない
local function is_straight(hand)
  local max = math.max(table.unpack(hand.ranks))
  local min = math.min(table.unpack(hand.ranks))
  local noDupSize = map_size(rank_map(hand.cards)) == 5
    
  if (max - min == 4) and noDupSize then
    return true
  end

  return false
end

local function is_flush(hand)
  return map_size(suit_map(hand.cards)) == 1
end

local function is_loyal_straight_flush(hand)
 local is_flash = is_flush(hand)
 
 --[[
 table.sortはインプレースでソートするため、コピーを作成してからソートする
 sortはデフォルトで昇順
 ]]
 local ranks ={table.unpack(hand.ranks)}
 table.sort(ranks)

 if ranks[1] == 1 and ranks[2] == 10 and ranks[3] == 11 and ranks[4] == 12 and ranks[5] == 13 then
   return true
 end
 
 return false
end

local function is_straight_flush(hand)
  return is_straight(hand) and is_flush(hand)
end

local function is_four_of_a_kind(hand)
  local map = rank_map(hand.cards)

  for _, v in pairs(map) do
    if v == 4 then
      return true
    end
  end

  return false
end

local function is_full_house(hand)
  return has_three_card(hand) and has_one_pair(hand)
end

local function is_three_of_a_kind(hand)
  return has_three_card(hand)
end

local function is_two_pair(hand)
  local map = rank_map(hand.cards)
  local count = 0

  for _, v in pairs(map) do
    if v == 2 then
      count = count + 1
    end
  end

  return count == 2
end

local function is_one_pair(hand)
  return has_one_pair(hand)
end

--[[
 ここで roles = { loyal_straight_flush = is_loyal_straight_flush, ... } としていないのは、
 pairsで回す際に連想配列だと順序が保証されないため。
]]
local roles = {
  {name = "loyal_straight_flush", func = is_loyal_straight_flush},
  {name = "straight_flush", func = is_straight_flush},
  {name = "four_of_a_kind", func = is_four_of_a_kind},
  {name = "full_house", func = is_full_house},
  {name = "flush", func = is_flush},
  {name = "straight", func = is_straight},
  {name = "three_of_a_kind", func = is_three_of_a_kind},
  {name = "two_pair", func = is_two_pair},
  {name = "one_pair", func = is_one_pair},
  {name = "high_card", func = function() return true end}
}

local function role(hand)
  for _, role in pairs(roles) do
    if role.func(hand) then
      return role.name
    end
  end
end

return role
