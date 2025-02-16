local rank_map = require "utils/rank_map"
local suit_map = require "utils/suit_map"

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
  local ranks = hand.ranks
  ngx.log(ngx.STDERR, 'check straight!\n', ranks[1], ranks[2], ranks[3], ranks[4], ranks[5])
  local max = math.max(table.unpack(hand.ranks))
  local min = math.min(table.unpack(hand.ranks))

  local noDupSize = #rank_map(hand.cards) == 5

  if (max - min == 4) and noDupSize then
    return true
  end

  return false
end

local function is_flush(hand)
  return #suit_map(hand.cards) == 1
end

local function is_loyal_straight_flush(hand)
 -- TODO
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

local roles = {
  loyal_straight_flush = is_loyal_straight_flush,
  straight_flush = is_straight_flush,
  four_of_a_kind = is_four_of_a_kind,
  full_house = is_full_house,
  flush = is_flush,
  straight = is_straight,
  three_of_a_kind = is_three_of_a_kind,
  two_pair = is_two_pair,
  one_pair = is_one_pair,
  high_card = function() return true end
}

local function role(hand)

  ngx.log(ngx.STDERR, 'lets check the role!\n', tostring(hand.cards[1].rank), tostring(hand.cards[1].suit), tostring(hand.cards[2].rank), tostring(hand.cards[2].suit), tostring(hand.cards[3].rank), tostring(hand.cards[3].suit), tostring(hand.cards[4].rank), tostring(hand.cards[4].suit), tostring(hand.cards[5].rank), tostring(hand.cards[5].suit))


  if is_loyal_straight_flush(hand) then
    return "loyal_straight_flush"
  elseif is_straight_flush(hand) then
    return "straight_flush"
  elseif is_four_of_a_kind(hand) then
    return "four_of_a_kind"
  elseif is_full_house(hand) then
    return "full_house"
  elseif is_flush(hand) then
    return "flush"
  elseif is_straight(hand) then
    return "straight"
  elseif is_three_of_a_kind(hand) then
    return "three_of_a_kind"
  elseif is_two_pair(hand) then
    return "two_pair"
  elseif is_one_pair(hand) then
    return "one_pair"
  else
    return "hogehoge"
  end
end

return role
