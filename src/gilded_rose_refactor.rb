require_relative './item'

class GildedRose
    def initialize(items)
        @items = items
    end


    def update_quality
         @items.each do |item|
            if name?(item.name)  
                if quality?(item.quality)
                    quality_less(item)
                end
            else
                if quality?(item.quality)
                    quality_sum(item)   
                    if !name?(item.name) and sell_in?(item.sell_in)  
                        quality_sum(item)
                    end
                    if sell_in?(item.sell_in) and quality?(item.quality)
                        quality_sum(item.quality)
                    end
                end
            end
            if name?(item.name)
                sell_in_less(item)
            end
         end
    end

    #modifica el item.quality
    def quality_sum(item)
        item.quality = item.quality + 1
    end

    def quality_less(item)
        item.quality = item.quality - 1 
    end

    def sell_in_less(item)
        item.quality = item.quality - 1
    end

    #Verificaciones del quality, sell in y name
    def quality?(quality)
        quality > 0 and quality < 50
    end

    def sell_in?(sell_in)
        sell_in < 11 || sell_in < 6
    end

    def name?(name)
        case name
            when "Aged Brie"
                :false
            when "Backstage passes to a TAFKAL80ETC concert"
                :false
            when "Sulfuras, Hand of Ragnaros"
                :false
            else
                :true 
            end        
    end
    @items
end

items = [
    Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
    Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
    Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
    Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
    Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
    Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
    Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
    Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
    # This Conjured item does not work properly yet
    Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6) # <-- :O
  ]
  
  gilded_rose = GildedRose.new(items)
  puts gilded_rose.update_quality