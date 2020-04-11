class Genre 
  
  attr_accessor :name, :songs
  extend Concerns::Findable

@@all = []    #class variable



def initialize(name)   #initialize method
    @name = name  #instance variable
    @songs = []
    save
  end
  
  def self.all     #capital A Artist wants to call the all method
  @@all 
end

def self.destroy_all
    @@all = []           #resets the @@all class variable of empty array
  end

def save 
  @@all << self       #instance(single song) we want to push to the array to save it
end 


  def self.create(genre)
    self.new(genre)
  end
  
  
  def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end
  
end