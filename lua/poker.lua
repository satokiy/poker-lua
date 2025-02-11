local function evaluate_hand(hand)
    -- ポーカーの役判定ロジックをここに実装
    return "役の名前"
end

local hand = {"AS", "KS", "QS", "JS", "10S"} -- 例としてロイヤルフラッシュ
ngx.say(evaluate_hand(hand))
