class GildedRose

  def initialize(items)
    @items = items
  end

  def check_special_item(item)
    if (item.name != "Aged Brie") && (item.name != "Backstage passes to a TAFKAL80ETC concert") && (item.name != "Sulfuras, Hand of Ragnaros")
      return true
    else
      false
    end
  end

  def update_quality_regular_item
    @items.each do |item|
        if (item.quality > 0) && (check_special_item(item) == true)
            item.quality -= 1
      else
        if item.quality < 50
          item.quality += 1
        end
        end
  end
  end

  def update_quality_special_item
    @items.each do |item|
    if item.quality < 50
      item.quality += 1
      if (item.name == "Backstage passes to a TAFKAL80ETC concert") && (item.sell_in < 11) && (item.sell_in < 6)
            (item.quality += 1) && (  item.quality += 1)
      end
    end
  end
  end

def update_legendary_item
  @items.each do |item|
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in -= 1
    end
  end
end

def accelerated_depreciation
  @items.each do |item|
    if (item.sell_in < 0) && (item.quality > 0) && (check_special_item(item) == true)
        item.quality -= 1
      else
          item.quality -= item.quality
    end
        if item.quality < 50
          item.quality += 1
        end
    end
end

  def update_quality
    update_quality_regular_item
    update_quality_special_item
    update_legendary_item
    accelerated_depreciation
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
