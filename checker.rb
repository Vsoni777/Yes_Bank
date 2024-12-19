$login_id="yesbank"
$login_password="rajsir@123"
module Checker 
   #check Phone_no valid or not
   def self.valid?(ph_no)
    ph_no.match?(/^(\(\d{3}\)\s?|\d{3}-)\d{3}-\d{4}$/)
   end
   
   def self.super_user(id,password)
     return $login_id==id && $login_password==password
   end
   #check login detail for authentication
   #handle exception
   def self.login(customer_id,accounts)
         return accounts[customer_id]
   end

   def self.check(customer_id,accounts)
    return accounts.has_key?(customer_id)
   end
end