require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "fixme"
    end

    it "sellin goes down by 1 on regular items" do
      items = [Item.new("fixme", 1, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(0)
    end

    it "quality goes down by 1 on regular items" do
      items = [Item.new("fixme", 1, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(0)
    end

    it "Sulfuras unnaffected" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(1)
    end

    it "Aged Brie increases in quality" do
      items = [Item.new("Aged Brie", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(2)
    end
    #
    it "Backstage Pass increases in quality" do
      items = [Item.new("Aged Brie", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(2)
    end
  end

end
