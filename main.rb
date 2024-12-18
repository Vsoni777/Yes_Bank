require_relative 'checker'
require_relative 'acount_holder'
require_relative 'operation'
require_relative 'accountmanager'
require_relative 'dummy'
require_relative 'tranaction'
# require './FileSaving'
class Main
  #include module
  include Dummy
  extend AccountManager
  extend Checker
  extend Operation
  #extend Save
  @@accounts=Dummy.to_give_dummydata
  attr_accessor :account,:operation,:auth,:save

  #per Instance call choice_option method
  def initialize
    History.new
    choice_option
   
  end

  # #to get Account_holder detail
  # def account_holder
  #   @account=set
  # end
  #check user is authenticate or not
  def authentication_user(customer_id,name)
    mathched_detail=Checker.login(customer_id,name,@@accounts)
    mathched_detail
  end

  #Index Page
  def choice_option
      loop do
        puts "--------------------------------------------------------------"
      puts "Enter choice (1 - Create Account, 2 - Login, 3 - Display,4 - exit): "
      choice=gets.chomp.strip.to_i
      case choice
      when 1
        puts "Create Account and Fill detail #{@@accounts.length}"

        @account=Account.new(@@accounts.length)
        to_save
      when 2
        puts "Enter customer_id"
        customer_id=gets.chomp.to_i 
        auth=Checker.login(customer_id,@@accounts)
        dash_board(auth[:customer_id])
      when 3
        puts "account displayed"
        AccountManager.display(@@accounts)        # to save data on stack
      when 4
        puts "exit"
        # to_save_file
        puts "--------------------------------------------------------------"
        break
      else
        puts "Invalid choice"
      end
    end
  end

  #Dashboard
  def dash_board(customer_id)
   puts "Welcome in user Dashborad........"
   puts customer_id
   loop do
    puts "Enter choice (1 -'Credit',2- 'debit',3 - 'fund transfer',4 -  'display', 5 -'his',6- 'close'): "
   puts "---------------------------------------------------------------"
   choice=gets.chomp.strip.downcase
   case choice
   when "credit"
    puts "enter amount for Credit"
    amount=gets.chomp.to_i
    @account=Operation.credit(customer_id,amount,@@accounts)
   when "debit"
    puts "enter amount for Debit"
    amount=gets.chomp.to_i
    @account=Operation.debit(customer_id,amount,@@accounts)

   when "transfer"
    puts "Could you enter second customer _id"
    # to check first
    cus_id2=gets.chomp.to_i
    if Checker.check(cus_id2,@@accounts)
      puts "enter Amount"
      amount=gets.chomp.to_i
      Operation.to_transfer(customer_id,cus_id2,amount,@@accounts)
    else
      puts "Invalid is not exist"
    end
   when "display"
    Operation.display(customer_id,@@accounts)
    # to_read_content
   when 'his'
    Operation.display_histroy(@@accounts[customer_id])
   when "close"
    puts "Exit----------------"
    # to_save_file
    break
   else
    puts "Invalid choice"
   end
  end
  end

  #convert hash value
  def to_save 
    puts account.customer_id
    temp=AccountManager.hash_register(account)
    @@accounts.merge!(temp)
    puts "#{@@accounts}"
  end
   
  # #to save Data prmanent
  # def to_save_file
  #  Save.to_save(@@accounts)
  # end

  # #to_read file
  #  def to_read_content
  #    @@accounts=save.process(@@accounts)
  #  end
end

Main.new 


