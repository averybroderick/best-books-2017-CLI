require 'nokogiri'
require 'open-uri'
require 'pry'
# require_relative './scraper.rb'

class Book
  attr_accessor :title

   @@all = []

   def initialize(title)
     @title = title
   end

   def self.all
     @@all.each do |book|
       puts book.title
     end
   end
end

class Genre
  #scrape https://www.goodreads.com/choiceawards/best-books-2017 for h4 heading
  attr_accessor :name

  @@all = []

  def initialize(name, link)
    @name = name
    # Scraper.genre_page_scrape(link)
    @@all << self
  end

  def self.all
    @@all.each do |genre|
      puts genre.name
    end
  end

end

class Scraper

  def self.genre_scrape(url='https://www.goodreads.com/choiceawards/best-books-2017')
    url = Nokogiri::HTML(open(url))
    url.css("div.category.clearFix").each do |genre|
      Genre.new(genre.css("h4").text, genre.css("a").attribute("href").value)
    end
  end

  def self.genre_page_scrape(url)
    base = 'https://www.goodreads.com'
    url = Nokogiri::HTML(open(base + url))
    url.css("div.answerWrapper img").each do |title|
      Book.new(title.attribute("alt").value)
    end
  end

end
