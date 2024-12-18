require_relative 'checker'
require_relative 'authentication'
class Account
  extend Checker
  extend Authenticate
  attr_accessor  :customer_id,:acc_no,:name,:ph_no,:type,:balance

  #customerdetails
  def initialize(length)
    @customer_id=generate_customerid(length)
    @acc_no=generate_acc(length)
    @name=set_name
    @ph_no=set_ph_no
    @type=set_type
    @balance=set_balance
  end

  

  #name of Account_holder
  def set_name
    puts "Enter name of consumer: "
    name=gets.chomp
    return name.strip.capitalize
  end

  #check lengh of String and then store
  def set_ph_no
    puts "enter phone no."
    temp=gets.chomp
    if Checker.valid?(temp)
     return temp
    else
      puts "invalid"
      set_ph_no
    end
  end

  def set_type
    puts "enter type of account"
    acc_type=gets.chomp.strip
    case acc_type
    when "saving"
        return acc_type
    when "current"
      return acc_type
    else  
      puts "Invalid"
      set_type
    end
  end
  
  #should handle Exception on here
  def set_balance
    puts "Enter balance for the Account option"
    amount=gets.chomp.to_i
    if amount>=500
      return amount
    else
      puts "Store minimum 500 amount"
      set_balance
    end
  end



  def generate_acc(length)
    last_acc_no=length+1+100
    return last_acc_no
  end

  def generate_customerid(length)
    last_cus_id=length+1
    puts last_cus_id
    return last_cus_id
  end


  
  ##to update current user
#  def update(acc,accounts)
#   matched=acc.find do |account|
#     account[:email]==acc.email && account[:passsword]==acc.password
#   end
#   if mathched 
#     Main.new.register(matched)
#   else 
#     puts "Not updated"
#   end
#  end
  
end

