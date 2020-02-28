class ElectronicDevices::Menus

  def self.laptop_menu
    doc = Nokogiri::HTML(open("https://www.techradar.com/news/mobile-computing/laptops/best-laptops-1304361"))
    #binding.pry


    name = doc.search("h3").text #needs abrigiing shows all ten names
    spec = doc.search("p.specs__container").text
    price = doc.search(" div.hawk-price-deal-full-price-main div.hawk-affiliate-link-container").text


    laptop = Product.new(name.split(". "), spec.split("SSD"), price.split("$"))



  end

  #needs revormating
  def self.phone_menu

    phonedoc = Nokogiri::HTML(open("https://www.t3.com/us/features/best-smartphone"))

    name = phonedoc.search("h3.product__title").text #needs abrigiing shows all ten names
    spec = phonedoc.search("div.product-summary__container").text
    price = phonedoc.search("div.hawk-price-deal-full-price-container  span.hawk-display-price-price").text


    phone = Product.new(name.split(". "), spec.split("$"), price.split("Weight:"))

  end


  def self.scrapePhone
    phonedoc = Nokogiri::HTML(open("https://www.t3.com/us/features/best-smartphone"))



  end

end
