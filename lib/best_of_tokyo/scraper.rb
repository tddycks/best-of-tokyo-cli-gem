class Scraper

  def self.scrape_index_page(url)
    doc = Nokogiri::HTML(open(url))

    doc.css("div.attraction-element").collect do |attraction|
      {
        :name => attraction.css("a.attraction-name").text.strip,
        :rating => attraction.css("p.rating").css("img").attribute("alt").text.strip,
        :url => "http://travel.usnews.com" + attraction.css("a.attraction-name").attribute("href").value
      }
    end
  end


  def self.scrape_attraction_page(url)
    doc = Nokogiri::HTML(open(url))
    page = {}
    page[:address] = doc.css("div#address").first.text.strip 
    page[:time] = doc.css("ul.attraction-info.no-bullet li").last.text
    page[:description] = doc.css("div.quotes p").text
    page
  end
end

