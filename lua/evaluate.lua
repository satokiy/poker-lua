local map = require "utils/map"
local Hand = require "hand"

local function validate(hand)
  if #hand ~= 5 then
    return error("Invalid hand size")
  end

  return hand
end

local function evaluate(hand)
  
  local valid, result = pcall(validate, hand)
  if not valid then
    return nil, result
  end

  local role = Hand.new(hand):role()

  return role
end

return evaluate