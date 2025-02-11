local card_module = require "card"
local map = require "utils/map"
local role = require "role"

local function ranks(cards)
  local ranks = {}
  for _, card in ipairs(cards) do
    table.insert(ranks, card.rank)
  end
  return ranks
end

local function suits(cards)
  local suits = {}
  for _, card in ipairs(cards) do
    table.insert(suits, card.suit)
  end
  return suits
end

local Hand = {}
Hand.new = function(cards)
  cards = map(cards, card_module.create_card)
  return {
    cards = cards,
    ranks = ranks(cards),
    suits = suits(cards),
    role = function() return role(cards) end
  }
end

return Hand
