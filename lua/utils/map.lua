local function map(tbl, func)
  local t = {}
  for i, v in ipairs(tbl) do
    t[i] = func(v)
  end
  return t
end

return map
