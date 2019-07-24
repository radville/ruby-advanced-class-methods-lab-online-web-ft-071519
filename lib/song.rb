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
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    matching = nil
    @@all.each do |song|
      if song.name == song_name
        matching = song
      end
    end
    matching
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1].chomp(".mp3")
    new_song = new_by_name(name)
    new_song.artist_name
  end

end
