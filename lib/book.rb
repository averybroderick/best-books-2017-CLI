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
