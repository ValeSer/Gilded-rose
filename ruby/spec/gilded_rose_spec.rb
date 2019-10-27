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
    context '#quality' do
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
      it "tests normal item cannot go under 0" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end

      it "tests Sulfuras" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(10)
      end
      it "tests Aged Brie" do
        items = [Item.new("Aged Brie", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(11)
      end
      it "tests expired Aged Brie" do
        items = [Item.new("Aged Brie", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(12)
      end
      it "tests item quality does not go over 50 " do
        items = [Item.new("Aged Brie", 0, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "tests item 1 quality of 50 stays 50" do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "tests item 2 quality of 50 stays 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "tests Backstage passes" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(11)
      end
      it "tests Backstage passes after 10 or less days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(12)
      end
      it "tests Backstage passes after 5 or less days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(13)
      end
      it "tests expired Backstage passes" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end

    end
  end

end
