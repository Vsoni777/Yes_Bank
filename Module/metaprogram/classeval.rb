class Squre 
  
end

#evaluate class_eval to define method at runtime
Squre.class_eval do 
  def aera(length)
    length*length
  end
end

p Squre.new.aera(12)