local suits = {
  "S",
  "H",
  "D",
  "C"
}

local ranks = {
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "1"
}

local function shuffle(deck)
  local shuffled_deck = {}
  for i = 1, #deck do
    local random_index = math.random(1, #deck)
    table.insert(shuffled_deck, deck[random_index])
    table.remove(deck, random_index)
  end
  return shuffled_deck
end

local Deck = {}

Deck.new = function()

  math.randomseed(os.time())
  
  local deck = {}
  for _, suit in ipairs(suits) do
    for _, rank in ipairs(ranks) do
      table.insert(deck, suit .. rank)
    end
  end
  deck = shuffle(deck)
  
  return {
    cards = deck,
    deal = function(self, n)
      if n > #self.cards then
        return error("Not enough cards in deck")
      end

      local hand = {}
      for i = 1, n do
        -- deckの一番上のカードを除き、handに追加
        table.insert(hand, table.remove(self.cards, 1))
      end
      return hand
    end
  }
end


return Deck
