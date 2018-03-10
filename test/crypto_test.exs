defmodule CryptoTest do
  use ExUnit.Case

  doctest Veritaserum

  import Veritaserum

  describe "crypto-specific terms" do
    test "the algorithm correctly assigns it" do
      assert analyze("btc is under 6k buy buy buy!") > 0
      assert analyze("to the moon baby, btc is over $20000!") > 0
      assert analyze("LTC forever #ToTheMoon") > 0
      assert analyze("LTC is on a trip #ToTheMoon") > 0
      assert analyze("eth is way underpriced right now") > 0
      assert analyze("XRP #HODL") > 0
      assert analyze("ETH dipping but im going to hodl") > 0
      assert analyze("price is going down but I'm still hodling") > 0
      assert analyze("TRON is completely decentralized") > 0
      assert analyze("BTC is the only unregulated coin") > 0
      assert analyze("Russia will never regulate BTC") > 0
      assert analyze("NANO is the only scalable blockchain solution") > 0

      assert analyze("btc is over 20k, time to sell!") < 0
      assert analyze("dump your btc before the market corrects") < 0
      assert analyze("bitcoin is worthless") < 0
      assert analyze("BCH is a shitcoin knock-off") < 0
      assert analyze("BCH is just another alt") < 0
      assert analyze("BTC will never scale") < 0
      assert analyze("BTC is not scalable") < 0
      assert analyze("BTC is unscalable") < 0
      assert analyze("XRP is centralized") < 0
      assert analyze("BTC was just regulated") < 0
      assert analyze("What does the US do? Regulate BTC") < 0
      # assert analyze("LTC will not go #ToTheMoon") < 0
      #
      # sentences that purely comment on price shouldn't get a sentiment score
      assert analyze("price of $BTC is going up") == 0
      assert analyze("$BTC price is going way down") == 0

      # too much to ask to have this understand sarcasm?
      assert !analyze("Sold all my bitcoin to get in on bread and milk. $Bread $Milk #ToTheMoon") > 0
    end
  end

end
