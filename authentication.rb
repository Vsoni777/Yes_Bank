module Authenticate 
 

   def self.email_valid?(temp)
    temp.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
   end

 
end