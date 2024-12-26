def fact(num)
  if num<0
    return "number should be greater than o"
  end
  if num<=1
    1
  else
    num*fact(num-1)
  end
end

puts fact(0)