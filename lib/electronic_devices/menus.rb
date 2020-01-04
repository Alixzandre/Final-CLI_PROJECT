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

  def self.phone_menu
    doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/253146/the-best-phones"))

    phone = self.new
    phone.nameList = doc.search("h3").text #needs abrigiing shows all ten names
    phone.specList = doc.search("ul.pros-cons").text
    #phone.priceList = doc.search(" div.hawk-price-deal-full-price-main div.hawk-affiliate-link-container").text

    phoneName = phone.nameList.split("\n")
    phoneName1 = phoneName.reject(&:empty?)

    phoneSpec = phone.specList.split("\n")
    phoneSpec1 = phoneSpec.reject(&:empty?)

    i = 1
    loop do
    puts "#{phoneName1[i]}\n#{phoneSpec1[i]}
          -
    "
    i+=1
      if i == 9
        break
      end
    end
  end


  def self.scrapePhone
    doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/253146/the-best-phones"))
    binding.pry
  end

end
