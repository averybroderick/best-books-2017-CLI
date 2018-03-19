class CLI
  def self.run
    Scraper.genre_scrape
    puts "Welcome to Best Books of 2017:"
    puts "Please pick a genre from the following:"
    Genre.show_all
    input = gets.strip
    Genre.all.each do |genre|
      if genre.name == input
        Scraper.genre_page_scrape(genre, genre.link)
        genre.books.each do |book|
          puts book.title
        end
      end

    end
  end
end
