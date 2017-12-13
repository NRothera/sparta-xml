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

end


x = GuiseppesMenu.new
puts x.get_menu_prices.last.text

puts x.get_menu_names.first.text
puts x.get_menu_names[2].text
