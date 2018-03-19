class Genre
  #scrape https://www.goodreads.com/choiceawards/best-books-2017 for h4 heading
  attr_accessor :name

  @@all = []

  def initialize(name, link)
    @name = name
    Scraper.genre_page_scrape(link)
    @@all << self
  end

  def self.all
    @@all.each do |genre|
      puts genre.name
    end
  end

end
