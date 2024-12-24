class LongSub
  attr_accessor :str
  
  def initialize(str = "pwwkew")
    @str = str
  end
  
  def max_non_repeated
    char_index_map = {}
    max_length = 0
    start = 0
    longest_substring = ""

    str.chars.each_with_index do |char, i|
      if char_index_map.key?(char) && char_index_map[char] >= start
        start = char_index_map[char] + 1
      end
      
      char_index_map[char] = i
        
      if i - start + 1 > max_length
        max_length = i - start + 1
        longest_substring = str[start..i]
      end
    end

    { string: longest_substring, length: max_length }
  end
end

result = LongSub.new("vjiqenrgeqpwwkew").max_non_repeated
p result  
