require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect do |person|
      person.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if @@all.detect {|person| person.name==name} == nil
      song = self.new
      song.name = name
      @@all << song
      song
    else
      @@all.detect do |person|
        person.name == name
      end
    end
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    information = filename.split("-").join("").split(".mp3").join("  ").split("  ")
    song = self.new
    song.name = information[1]
    song.artist_name = information[0]
    song
  end

  def self.create_from_filename(filename)
    information = filename.split("-").join("").split(".mp3").join("  ").split("  ")
    song = self.create
    song.name = information[1]
    song.artist_name = information[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
