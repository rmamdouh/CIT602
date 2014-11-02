# Mixing in modules
#[6] we would like to add a function that replaces a word with another
# replace_word(old_word, new_word)

#Metaprogramming
#[7] instead of calling document.replace_word(old,new) we would like to be able to
# do something like this: document.replace_book('pen') where book is the old word
# and pen is the new word. This should work on any word (not just book).
# hint:  'method_missing'

class Document
    attr_reader   :author
    attr_reader   :title
    attr_reader   :price
    
    def initialize(author, title, price)
        @author = author
        @title = title
        @price = price
    end
    
    def +(otherObj)
      Document.new("#{@author}, #{otherObj.author}", "#{@title}, #{otherObj.title}", @price+otherObj.price)
    end

    def words
      @title.split(/[\s|,]+/)
    end

    def each_word
      words.each do |w|
        yield w
      end
    end
end


  # These examples should work
  a=Document.new("Dan Brown", "DaVinci Code", 50)
  b=Document.new("Bruce Schneier", "Applied Cryptography", 120)
  
  total = a + b
  total = total + Document.new("Taha Hussein", "Al-Ayam", 30)
  
  puts total.words.to_s
  total.each_word {|w| puts w }

