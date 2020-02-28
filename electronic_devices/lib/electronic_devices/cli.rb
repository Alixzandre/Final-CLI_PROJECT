class ElectronicDevices::CLI

  def call
    list_products
    menu
    bye
  end


  def list_products
    puts "This is a program that show you\nthe best items of their respecive category"
    puts <<-DOC
    List of products
      - laptops
      - Smart Phones
    DOC
  end

  def menu
      puts " ---------------------------------------------"
      puts " ---Enter the product you would like to see---"
      puts " ---Type list to show product list -----------"
      puts " --- Type exit to duh ------------------------"
      puts " ---------------------------------------------"
      input = nil
      while input != "exit"
        input = gets.strip.downcase
        case input
        when "list"
          list_products
        when "laptops"
          Product.create_laptop
        when "smart phones"
          Product.phone
        else
          puts "Not apart of the list type exit or retry"
        end
      end
    end

  def bye
    puts "bye"
  end




end
