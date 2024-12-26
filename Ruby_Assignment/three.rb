require './first'
class Finder
  include Frequency
  attr_accessor :word_count
  def initialize
    @word_count = Hash.new(0)
  end

  def for_string(str, word_count) 
    str.downcase.split(/\W+/).each { |word| word_count[word] += 1 unless word.empty? }
  end


  def process(input, word_count)
    case input
    when String, Symbol
      input=input.to_s
      for_string(input,word_count)
    when Hash
      input.each do |key, value|
        process(key, word_count) 
        process(value, word_count)
      end
    when Array
      input.each { |element| process(element, word_count) }
    end
  end 

  def count_words(input)  
    process(input, word_count)  
    #comment
    word_count
  end 
end






# input = "Hello world, welcome to Ruby!"
input = {
  "hello world" => "Ruby is fun",
  details: {
    description: "Ruby rocks in the programming world",
    :"extra info" => ["hello again", "world of Ruby"]
  }
}
 p Finder.new.count_words(input)
# input = [
#   "Hello world",
#   { 
#     "Ruby language" => "is fun",
#     details: [
#       "Ruby rocks", 
#       { "hello again" => "world is round" }
#     ]
#   },
#   [
#     "Complex structures are interesting",
#     { more_data: ["Hello", "world of Ruby"] }
#   ]
# ]
