# Write a Ruby method word_frequency that takes an array of strings as input. Each string contains a sentence. The method should:
# 1. Count the frequency of each word across all the sentences (case-insensitive).
# 2. Return a hash where keys are the words, and values are their respective frequencies.

sentences = [
  "Hello world",
  "hello Ruby",
  "Ruby is awesome",
  "World is big"
]
new_arr=Array.new
sentences.each do |value|
 new_arr.push(value.downcase.split)
end

new_arr.flatten!
hash={}
count=0
new_arr.each do |element|
        key=element
        new_arr.each do |element|
          if key==element
            count+=1;
          end
        end
        hash[key]=count
        count=0
end

puts hash