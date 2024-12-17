require './Checker'
require './Account_Holder'
require './AccountManager'
require './Operation'
class Main
  #include module
  # include Account
  extend Account_Manager
  extend Checker
  extend Operation
  @@accounts=[]
  attr :account,:operation,:auth

  #per Instance call choice_option method
  def initialize
    choice_option
  end

  # #to get Account_holder detail
  # def account_holder
  #   @account=set
  # end
  #check user is authenticate or not
  def authentication_user(email,password)
    mathched_detail=Checker.login(email,password,@@accounts)
    mathched_detail
  end

  #Index Page
  def choice_option
      loop do
      puts "Enter choice (1 - Create Account, 2 - Login, 3 - save,4 - exit): "
      choice=gets.chomp.strip.to_i
      case choice
      when 1
        puts "Create Account and Fill detail"
        @account=Account.new
      when 2
        puts "Enter email and Password for Login Dashborad"
        email=account.set_email
        password=account.set_password
        auth=authentication_user(email,password)
        dash_board(auth)
      when 3
        to_save
        puts "your detail are saved"
      when 4
        puts "exit"
        break
      else
        puts "Invalid choice"
      end
    end
  end

  #Dashboard
  def dash_board(auth)
   puts "Welcome in user Dashborad........"
   loop do
    puts "Enter choice ('Credit', 'debit',   'display', 'close'): "
   
   choice=gets.chomp.strip.downcase
   case choice
   when "credit"
    @account=Operation.credit(auth,choice,@@accounts)
    to_save
   when "debit"
    @account=Operation.debit(auth,choice,@@accounts)
    
   when "display"
    Operation.display(auth,choice)
    dash_board
   when "close"
    puts "Exit----------------"
    break
   else
    puts "Invalid choice"
   end
  end
  end

  #convert hash value
  def to_save 
    temp=Account_Manager.hash_register(account)
    @@accounts<<temp
  end

end

Main.new 


