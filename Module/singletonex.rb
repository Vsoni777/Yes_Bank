class  Demo  
  def initialize(n) 
      @value=n                     
  end    
  
  def hello()
      puts "hello! ,#{@value}"
  end
end    

#instance creation
k=Demo.new(99) 
#with help of instance singleton_method create
def k.hi() 
  puts "Hi! ,#{@value}"
end
#to call singlton method
k.singleton_method(:hi).call
# m = k.singleton_method(:hi)
# m.call
#NameError
# m = k.singleton_method(:hello)