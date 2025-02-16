local card_module = require "card"
local map = require "utils/map"
local role = require "role"

local function ranks(cards)
  local ranks = {}
  for _, card in ipairs(cards) do
    table.insert(ranks, tonumber(card.rank))
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
Hand.__index = Hand

function Hand.new(cards)
  local self = setmetatable({}, Hand)
  
  self.cards = map(cards, card_module.create_card)
  self.ranks = ranks(self.cards)
  self.suits = suits(self.cards)

  return self
end

function Hand:role()
  return role(self)
end

return Hand
