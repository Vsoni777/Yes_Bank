# Write a Ruby method word_frequency that takes an array of strings as input. Each string contains a sentence. The method should:
# 1. Count the frequency of each word across all the sentences (case-insensitive).
# 2. Return a hash where keys are the words, and values are their respective frequencies.
# hash=Hash.new(0)
class Frequency
  attr_accessor :input,:hash
  def initialize 
    @hash=Hash.new(0)
    @input=[
      "Hello world",
      "hello Ruby",
      "Ruby is awesome",
      "World is big"
    ]
  end

  def fre_counter
  input.join(' ').downcase.split.map!{|word| hash[word]+=1}
  hash
  end
end

p Frequency.new.fre_counter
