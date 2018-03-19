class Book
  attr_accessor :title, :genre

   @@all = []

   def initialize(title, genre)
     @title = title
     @genre = genre
     genre.books << self
   end

   def self.show_all
     @@all.each do |book|
       puts book.title
     end
   end
end
