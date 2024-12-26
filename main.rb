require './checker'
require './account_holder'
require './operation'
require './accountmanager'
require './dummy'
require './tranaction'
require './authentication'
require './customer'
$histroy_t = Hash.new { |hash, key| hash[key] = [] }
$login_id="yesbank"
$login_password="rajsir@123"
$accounts=Dummy.to_give_dummydata

class Main
  #include module
  include Dummy
  extend AccountManager
  extend Checker
  extend Operation
  include History
  include CustomerDashBorad
  # @@accounts=Dummy.to_give_dummydata
  attr_accessor :account,:operation,:auth,:save

  #per Instance call choice_option method
  def initialize
    choice_option
   
  end



  #Index Page
  def choice_option
    
      loop do
      begin
        puts "--------------------------------------------------------------"
        puts "Enter choice (1 - Login, 2- super_user,3 - exit): "
        choice=gets.chomp.strip.to_i
       case choice  
        when 1
          puts "Enter customer_id"
           customer_id=gets.chomp.to_i 
           raise if customer_id<=0
          auth=Checker.login(customer_id)
          CustomerDashBorad.dash_board(auth[:customer_id])
        when 2
          puts "Enter Super user Detail----------------------------"
          puts "Enter login id:-"
           id=gets.chomp
          puts "Enter login password:-"
           password=gets.chomp
          if Checker.super_user(id,password)
            AccountManager.dash_board
          else
            puts "Invalid User"
          end
        when 3
          puts "exit"
          # to_save_file
          puts "--------------------------------------------------------------"
          break
        else
          puts "Invalid choice"
       end
      end        
    rescue Exception
      puts "failed"
      
    end
  end  

 


end

Main.new 


