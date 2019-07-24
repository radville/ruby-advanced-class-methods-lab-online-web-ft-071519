require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new = self.new
    new.save
    new
  end
  
  def self.new_by_name(song)
    self.create #new
    self.name = song
    self
  end

end
