class ElectronicDevices::Menus
  attr_accessor :nameList, :priceList, :specList

  def self.laptop_menu
    doc = Nokogiri::HTML(open("https://www.techradar.com/news/mobile-computing/laptops/best-laptops-1304361"))
    #binding.pry
    laptop = self.new
    laptop.nameList = doc.search("h3").text #needs abrigiing shows all ten names
    laptop.specList = doc.search("p.specs__container").text
    laptop.priceList = doc.search(" div.hawk-price-deal-full-price-main div.hawk-affiliate-link-container").text

    laptopName = laptop.nameList.split(". ")
    laptopSpec = laptop.specList.split("SSD")
    laptopPrice = laptop.priceList.split("$")
    i = 1
    loop do
    puts "
      #{laptopName[i].chop}
        $#{laptopPrice[i]}
        #{laptopSpec[i-1]}SSD
      -
    "
    i+=1
      if i == 9
        break
      end
    end
  end

  #needs revormating
  def self.phone_menu
    samdoc = Nokogiri::HTML(open("https://www.t3.com/us/features/best-smartphone"))

    phone = self.new
    #list of phone names to be parsed
    phone.nameList = samdoc.search("h3.product__title").text #needs abrigiing shows all ten names
    #non accurate phone specs!!!!!!
    #^ processor Camera setup Battery Screen quality  <-needs ^
    phone.specList = samdoc.search("div.product-summary__container").text
    #list of phone prices
    phone.priceList = samdoc.search("div.hawk-price-deal-full-price-container  span.hawk-display-price-price").text

    phoneName = phone.nameList.split(". ")
    #phoneName1 = phoneName.reject(&:empty?)

    phonePrice = phone.priceList.split("$")


    phoneSpec = phone.specList.split("Weight:","Dimensions:")
    #phoneSpec1 = phoneSpec.reject(&:empty?)

    i = 1
    loop do
    puts "#{phoneName[i].chop} | #{phonePrice[i]} \n Weight: #{phoneSpec[i]}
          -
    "
    i+=1
      if i == 8
        break
      end
    end
  end


  def self.scrapePhone
    samdoc = Nokogiri::HTML(open("https://www.t3.com/us/features/best-smartphone"))


    binding.pry
  end

end
