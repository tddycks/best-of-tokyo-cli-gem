class Attraction

  attr_accessor :name, :rating, :url, :address, :time, :description

  @@attractions = []

  

  def initialize(attraction_hash)
    attraction_hash.each {|key,value| self.send("#{key}=",value)}
    @@attractions << self
  end


  def self.create_from_array(array)
    array.each do |attraction|
      self.new(attraction)
    end
  end

  def add_attributes(hash)
    hash.each {|key,value| self.send("#{key}=", value)}
  end


  def self.all
    @@attractions
  end

end


#First scrape page with scraper class (self.scrape_index). Returns an array of hashes. Then in Attraction class have method with creats
#attraction instances with the attributes from the array of hashes (#self.create_from_array). In CLI class (#make_attractions) call on the
#scraper method. This then sends each individual hash to 
#the initialize method which sets the attributes. Each instance created then gets stored in the @@attractions
#array. 
#then add more elements from profile_page to array. First user Scraper method to retrieve and store remaining 
#attributes by nokogiring the invidual attraction and storing the attributes in a hash
#Then in the attribute class create an instance method which can add attributes to instances of the class. 
#Then in cli class, add a method which iterates over the @@attractions array, uses each attraction url to scrape additional 
# attributes using the scrape method. Then uses the return of that method (a hash) to add those attributes to each instance
#of the attraction class (#add_attributes). Now we have instances of the the attraction class with all of the needed attributes 
#next
