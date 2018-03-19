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
