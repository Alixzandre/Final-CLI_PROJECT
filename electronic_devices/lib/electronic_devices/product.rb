
class Product
  attr_accessor :name, :price, :spec
  @@all = {}

  def initialize(name, spec, price)
    @name = name #only returns product
    @spec = spec #error
    @price = price
    @@all < self
  end

  def self.laptops
     ElectronicDevices::Menus.laptop_menu
    #puts "#{self.all.name}"
    #puts "#{self.all.nameList}"
    puts "#{self.all}"

      binding.pry

  end

  def self.all
    @@all
  end

end
