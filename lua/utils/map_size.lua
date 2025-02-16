local function map_size(map)
  local size = 0
  for _ in pairs(map) do
    size = size + 1
  end
  return size
end

return map_size
