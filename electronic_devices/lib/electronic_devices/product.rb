
class Product
  attr_accessor :nameList, :priceList, :specList
  @@all = []

  def initialize(name, spec, price)
    @name = name
    @spec = spec
    @price = price
    @@all << self
  end

  def self.create_laptop(name, spec, price)
    laptop = self.new(name.split(". "), spec.split("SSD"), price.split("$"))
    @@all << self
    
  end

  def self.all
    @@all

  end

end
