class CLI
  def self.run
    puts "Welcome to Best Books of 2017:"
    Scraper.genre_scrape
  end
end
