class Animal 
  private
  def protected_me
    p "in #{self.class}"
  end
end


class Mammal < Animal
  protected
  def call_me
    self.protected_me
  end
end

class Another < Animal
  def another_call
   Mammal.new.call
    self.protected_me
  end
end

Another.new.another_call