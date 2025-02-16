local role = require "role"
local Hand = require "hand"

describe("role", function()
    setup(function()
        _G.ngx = {
            log = function(...) print(...) end,
            STDERR = "STDERR"
        }
    end)

    it("loyal_straight_flush", function()
        local hand = {"S1", "S10", "S11", "S12", "S13"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "loyal_straight_flush")
    end)

    it("is_straight_flush", function()
        local hand = {"S1", "S2", "S3", "S4", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "straight_flush")
    end)

    it("is_four_of_a_kind", function()
        local hand = {"S1", "D1", "C1", "H1", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "four_of_a_kind")
    end)

    it("is_full_house", function()
        local hand = {"S1", "D1", "C1", "S5", "D5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "full_house")
    end)

    it("is_flush", function()
        local hand = {"S1", "S3", "S3", "S4", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "flush")
    end)

    it("is_straight", function()
        print("is_straight")
        local hand = {"S1", "D2", "C3", "D4", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "straight")
    end)

    it("is_three_of_a_kind", function()
        local hand = {"S1", "D1", "C1", "D4", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "three_of_a_kind")
    end)

    it("is_two_pair", function()
        local hand = {"S1", "D1", "C2", "D2", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "two_pair")
    end)

    it("is_one_pair", function()
        local hand = {"S1", "D1", "C2", "D3", "S5"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "one_pair")
    end)

    it("high_card", function()
        local hand = {"S1", "D2", "C3", "D4", "S6"}
        local hand = Hand.new(hand)
        assert.are.equal(role(hand), "high_card")
    end)
end)