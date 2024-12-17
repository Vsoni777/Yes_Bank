module Authenticate 
 

   def self.email_valid?(temp)
    temp.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
   end

  def self.pass_valid?(temp)
    temp.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}\z/)
  end
end