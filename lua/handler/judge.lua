local cjson = require "cjson"
local evaluate = require "../evaluate"

local function handle_request()
    ngx.req.read_body()
    local body = ngx.req.get_body_data()

    if not body then
        ngx.status = ngx.HTTP_BAD_REQUEST
        ngx.say("No body found")
        return
    end

    local result, res = pcall(cjson.decode, body)
    if result == false then
        ngx.status = ngx.HTTP_BAD_REQUEST
        ngx.say("Invalid JSON: `", body, "` ",res)
        return
    end
    
    if not res.hand then
        ngx.status = ngx.HTTP_BAD_REQUEST
        ngx.say("Invalid Request. Missing 'hand' key")
        return
    end

    local hand = res.hand
    ngx.log(ngx.STDERR, "Hand: ", cjson.encode(hand))
    local result = evaluate(hand)
    ngx.say(cjson.encode({result = result}))
end

handle_request()
