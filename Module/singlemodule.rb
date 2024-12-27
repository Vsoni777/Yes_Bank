module Other
  def three() end
end

class Single
  def Single.four() end
end

a = Single.new

def a.one()
end

class << a
  include Other
  def two()
  end
end

p Single.singleton_methods    
p a.singleton_methods(false)  
p a.singleton_methods         
