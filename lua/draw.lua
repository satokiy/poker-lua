local Deck = require "deck"
local cjson = require "cjson"

local d = Deck.new()
local function draw()
  local num_cards = tonumber(ngx.var.arg_num) or 5
  local success, result = pcall(
    function() return d:deal(num_cards) end
  )

  if not success then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Error dealing cards: " .. result)
    return
  end

  ngx.say(cjson.encode({hand = result}))
end

draw()
