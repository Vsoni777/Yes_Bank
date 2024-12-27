class Circle 
end

c=Circle.new
c.instance_eval do
  def area(r)
    3.14*r*r
  end
end

p c.area(3)