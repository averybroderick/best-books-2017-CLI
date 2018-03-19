class Genre
  #scrape https://www.goodreads.com/choiceawards/best-books-2017 for h4 heading
  attr_accessor :name, :link, :books

  @@all = []

  def initialize(name, link)
    @name = name
    @link = link
    @books = []
    @@all << self
  end

  def self.show_all
    @@all.each do |genre|
      puts genre.name
    end
  end

  def self.all
    @@all
  end

end
