class Attraction

  attr_accessor :name, :rating, :url, :address, :time, :description

  @@attractions = []


  def initialize(attraction_hash)
    attraction_hash.each {|key,value| self.send("#{key}=",value)}
    @@attractions << self
  end


  def self.create_from_array(array)
    array.each do |attraction_hash|
      self.new(attraction_hash)
    end
  end

  def add_attributes(hash)
    hash.each {|key,value| self.send("#{key}=", value)}
  end


  def self.all
    @@attractions
  end

end


