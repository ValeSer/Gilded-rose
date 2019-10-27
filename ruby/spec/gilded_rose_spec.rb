require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "decreases sell_in" do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(0)
    end
    context 'quality tests' do
      it "tests normal item" do
        items = [Item.new("foo", 20, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(9)
      end
      it "tests normal expired item" do
        items = [Item.new("foo", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(8)
      end
      it "tests Sulfuras" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(10)
      end
    end
  end

end
