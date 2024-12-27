class User 
  attr_accessor :name,:age
end

user_attr={name: "vivek",age: 24}
user =User.new
#dynamically set value on it
user_attr.each do |key,value|
  user.send("#{key}=",value)
end

puts user.name
puts user.age