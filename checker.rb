module Checker 
   #check Phone_no valid or not
   def self.valid?(ph_no)
    ph_no.match?(/^(\(\d{3}\)\s?|\d{3}-)\d{3}-\d{4}$/)
   end

   #check login detail for authentication
   def self.login(email,password,accounts)
    matched=accounts.find do |account|
      account[:email]==email && account[:passsword]==password
    end
    if matched
      puts "login Successfully"
      puts "You are logged in : #{matched[:name]}"
      return matched
    else 
      puts "Invalid detail"
    end
    
   end
    
    
end