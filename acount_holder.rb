require './Checker'
require './Auth'
require './Authentication'
class Account
  extend Checker
  extend Authenticate
  @@last_acc_no=100
  attr_accessor :acc_no,:name,:ph_no,:type,:balance,:auth
  def initialize
    @acc_no=generate_acc
    @name=set_name
    @ph_no=set_ph_no
    @type=set_type
    @balance=set_balance
    @auth=generate_authenication
  end

  def generate_authenication
    email=set_email
    password=set_password
    return Auth.new(email,password)
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

  def set_password
    puts "Enter password for account:"
    password = gets.chomp.strip
    if Authenticate.pass_valid?(password)
    return  password
    else
      puts "Password is invalid!"
      set_password
    end
  end

  def generate_acc
    @@last_acc_no+=1
    return @@last_acc_no
  end

  def set_email
    puts "Enter Email Address:"
    temp=gets.chomp.strip.downcase
    if Authenticate.email_valid?(temp)
      return temp
    else 
      puts "Invalid Email address"
      set_email
    end
  end

  
  ##to update current user
 def update(acc,accounts)
  matched=acc.find do |account|
    account[:email]==acc.email && account[:passsword]==acc.password
  end
  if mathched 
    Main.new.register(matched)
  else 
    puts "Not updated"
  end
 end
  
end

