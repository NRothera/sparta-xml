require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be no more than £10" do
    @xml_menu.get_menu_prices.each do |x|
      expect(x).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.get_menu_names.each do |calories|
      expect(calories).to be < 1000
    end

  end

  it "should have all waffle dishes stating you get two waffles" do
  # Consider children element methods - Remember to step through the data and print out to the command line if you need it
  end

end
