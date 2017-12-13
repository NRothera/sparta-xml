require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_names
    calories_not_full_breakfast = []
    @menu.search("name").each do |name|
      if name.text != 'Full Breakfast'
        @menu.search('calories').each do |calories|
          calories_not_full_breakfast.push(calories.text.to_i)
        end
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


end
