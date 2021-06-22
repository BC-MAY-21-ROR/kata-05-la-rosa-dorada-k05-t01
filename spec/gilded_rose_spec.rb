require 'spec_helper'
require_relative '../src/gilded_rose'
require_relative '../src/item'
require_relative './texttest_fixture'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end
end