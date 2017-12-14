require 'nokogiri'


class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end


  def get_menu_names
    @menu.search("name")
  end

  def get_menu_prices
    @menu.search('price')
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


x = GuiseppesMenu.new
puts x.get_menu_prices.last.text

puts x.get_menu_names.first.text
puts x.get_menu_names[2].text

puts x.xpath_get_names

puts x.xpath_get_description
