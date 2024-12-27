class Paint 
  
end

#dynamically create method at run time with help of Class name and definemethod
Paint.define_method(:brush) do |work|
  puts "painting with help of #{work}"
end

Paint.new.brush("cloth")