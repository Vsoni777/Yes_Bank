module Checker 
   attr_accessor :ph_no
  def valid_input?(ph_no)
    
     if ph_no.match?(/^(\(\d{3}\)\s?|\d{3}-)\d{3}-\d{4}$/)
       ph_no=ph_no
     else 
      puts 'invalid'
     end
  end
end