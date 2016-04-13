class CLI

  BASE_URL = "http://travel.usnews.com/Tokyo_Japan/Things_To_Do/"

  FACTS = [
    "Japan has the second-lowest homicide rate in the world. The homicide rate is 0.50 per 100,000 people.", 
    "Animated Japanese films and television shows (i.e., anime) account for 60% of the world’s animation.",
    "The world’s most expensive tuna was sold in Japan for $735,000 USD.",
    "Contrary to popular belief, true Kobe beef is only found in Japan, due to tight controls and restrictions.",
    "In Japan, snowmen are made of two large snowballs, not three.",
    "Haiku is the shortest poetic form in the world, consisting of only three lines.",
    "Japan imports about 85% of Jamaica’s total coffee production.",
    "Slurping your food is a sign that the food is delicious and is considered a compliment to the cook."
  ]

  def run
    make_attractions
    add_attributes
    list_attractions
    menu
    random_fact
    sayonara
  end

  def make_attractions
    array = Scraper.scrape_index_page(BASE_URL)
    Attraction.create_from_array(array)
  end


  def add_attributes
    @attractions = Attraction.all 
    @attractions.each do |attraction|
      hash = Scraper.scrape_attraction_page(attraction.url) 
      attraction.add_attributes(hash)
    end
  end

  def list_attractions
    puts "Tokyo rocks! If you go, here are some of the city's top spots:"
    puts ""
    @attractions.each.with_index(1) do |attraction, i| 
      puts "#{i}. #{attraction.name}".colorize(:blue) + " - #{attraction.rating << "/5.0"}"
    end
  
  end

  def menu
    input = nil
    while input != "s"
      puts ""
      puts "Choose an attraction to learn more, type 'menu' to see the list of attractions again or type ‘s' (for Sayonara!) to exit."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 18
        puts "-------------------- #{@attractions[input.to_i - 1].name.upcase} --------------------".colorize(:blue)
        puts @attractions[input.to_i - 1].address.gsub(/Official website/, "")
        puts @attractions[input.to_i - 1].time
        puts ""
        puts @attractions[input.to_i - 1].description.colorize(:light_red)

      elsif input == "menu"
        list_attractions
      end
    end
  end

  def random_fact
    puts "Random Japanese Fact:"
    puts FACTS.sample
  end


  def sayonara
    puts "Sayonara!"
  end


end