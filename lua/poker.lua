local cjson = require "cjson"

local function evaluate_hand(hand)
    -- ポーカーの役判定ロジックをここに実装
    return "役の名前"
end

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
        ngx.say("Invalid JSON")
        return
    end
    
    if not res.hand then
        ngx.status = ngx.HTTP_BAD_REQUEST
        ngx.say("Invalid Request. Missing 'hand' key")
        return
    end

    local hand = res.hand
    local result = evaluate_hand(hand)
    ngx.say(cjson.encode({result = result}))
end

handle_request()
