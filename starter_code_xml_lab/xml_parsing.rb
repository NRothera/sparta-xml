require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def calories_below_1000
    calories_not_full_breakfast = []
    @menu.search("food").each do |food|
      if food.search("name").text != "Full Breakfast"
        calories_not_full_breakfast.push(food.search("calories").text.to_i)
      end
    end
    calories_not_full_breakfast
  end

  def get_menu_prices
    all_prices = []
    @prices = @menu.search('price')
    @prices.each do |x|
      all_prices.push(x.text.split('£')[1].to_f)
    end
    all_prices
  end

  def xpath_get_names
    @menu.xpath('/breakfast_menu/food/calories')
  end

  def also_xpath_get_names
    @menu.xpath('//calories')#searches for calories
  end

  def xpath_get_food
    @menu.xpath('//food')
  end

  def xpath_get_description
    @menu.xpath('//description').text
  end

  def waffles_specify_two
    two_waffles_array = []
    @menu.search("food").each do |food|
      if food.search("name").text.split.last == "Waffles"
        if food.search("description").text.split.first == "Two"
          two_waffles_array.push(true)
        else
          two_waffles_array.push(false)
        end
      end
    end
    two_waffles_array
  end

end
something = GuiseppesMenu.new
something.waffles_specify_two
