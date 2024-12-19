module AccountManager
  

  def self.hash_register(account)
    acc_cus=account.customer_id
    puts "show customer #{acc_cus}"
    account= {acc_cus =>
                  {
                    customer_id: account.customer_id,
                    acc_no: account.acc_no,
                    name: account.name,
                    ph_no: account.ph_no,
                    acc_type: account.type,
                    balance: account.balance,
                  } 
                }  
    return account
  end

  def self.hash_totranaction(consumer,amount,operation)
    time=Time.new
    return new_hash={
      operation: operation,
      amount:  amount,
      balance: consumer[:balance],
      time:    time.strftime("%I:%M:%S"),
      date:    time.strftime("%d-%m-%y")
    }
  end
  
  def self.dash_board(accounts)
    puts '"welcome Account manager Dashboard-------------------------------".center'
    loop do
    puts "1- Create Account ,2- Display All account ,   3-History of All Account ,4- Show praticular Account details, 5- Credit Account ,6- Debit account,7 - fund transfer ,8- logout"
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"
    choice=gets.chomp.to_i
      case choice
      when 1
        # puts "Create Account and Fill detail #{@@accounts.length}"
        account=Account.new(accounts.length)
        Main.to_save(account) 
      when 2
        puts "Display All Account DetailS --------------"
        display(accounts)
      when 3
          puts "History of All Accounts "
          History.display_history_all
      when 4
        puts "Enter Customer id"
        customer=gets.chomp.to_i#handle
        if Checker.check(customer,accounts)
          History.display_history(customer)
        else 
          puts "User is not Exist"
        end
      when 5
        puts "enter customer id------"
        customer=gets.chomp.to_i #handle
        if Checker.check(customer,accounts)
          puts "Enter Amount"
          amount=gets.chomp.to_i#handle
          Operation.credit(customer,amount,accounts)
        else
          puts "User is not Exist"
        end
      when 6
        puts "enter Customer-id"
        customer=gets.chomp.to_i  #handle
        if Checker.check(customer,accounts)
          puts "enter Amount"
          amount=gets.chomp.to_i#handle
          Operation.debit(customer,amount,accounts)
        else
          puts "User Not Exist"
        end
      when 7
        puts "enter details of fund transfer"
        puts "Enter First Customer id"
        cus_id1=gets.chomp.to_i
        if Checker.check(cus_id1,accounts)
          puts "Enter second Customer_id"
          cus_id2=gets.chomp.to_i
          if Checker.check(cus_id2,accounts) 
              if cus_id1 != cus_id2
                puts "Enter Amount"
                amount=gets.chomp.to_i
                raise amount<=0
                 Operation.to_transfer(cus_id1,cus_id2,amount,accounts)
              else
                puts "you can't transfer use Credit or debit option please"
              end
          else
            puts "User is not Exist"
          end
        else
          puts "user is not Exist"
        end
      when 8
        puts "Logout-------------"
        break
      else
        puts "Invalid Choice"
      end
    end
  end

  def self.display(accounts)
    accounts.each do |key,details|
      puts "------------------------------------"
      puts "keys to assign #{key}"
        puts "-------------------------------"
           puts "Account Customer_id:  #{details[:customer_id]}"
           puts "Account no: #{details[:acc_no]}"
           puts "Account no: #{details[:name]}"
           puts "Account no: #{details[:ph_no]}"
           puts "Account no: #{details[:acc_type]}"
           puts "Account no: #{details[:balance]}"
      
   end
  
  end

  ##to store value
  def self.register(account)
    acc<<account
    return acc
  end

end