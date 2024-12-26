module AccountManager

  
  def self.dash_board
    puts '"welcome Account manager Dashboard-------------------------------".center'
    loop do
    puts "1- Create Account ,2- Display All account ,   3-History of All Account ,4- Show praticular Account details, 5- Credit Account ,6- Debit account,7 - fund transfer ,8- logout"
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"
    choice=gets.chomp.to_i
      case choice
      when 1
        # puts "Create Account and Fill detail #{@@accounts.length}"
        account=Account.new($accounts.length)
        Operation.to_save(account) 
      when 2
        puts "Display All Account DetailS --------------"
        Operation.display
      when 3
          puts "History of All Accounts "
          History.display_history_all
      when 4
        puts "Enter Customer id"
        customer=gets.chomp.to_i#handle
        if Checker.check(customer)
          History.display_history(customer)
        else 
          puts "User is not Exist"
        end
      when 5
        puts "enter customer id------"
        customer=gets.chomp.to_i #handle
        if Checker.check(customer)
          puts "Enter Amount"
          amount=gets.chomp.to_i#handle
          raise if amount<=0
          Operation.credit(customer,amount)
        else
          puts "User is not Exist"
        end
      when 6
        puts "enter Customer-id"
        customer=gets.chomp.to_i  #handle
        if Checker.check(customer)
          puts "enter Amount"
          amount=gets.chomp.to_i#handle
          raise if amount<=0
          Operation.debit(customer,amount)
        else
          puts "User Not Exist"
        end
      when 7
        puts "enter details of fund transfer"
        puts "Enter First Customer id"
        cus_id1=gets.chomp.to_i
        if Checker.check(cus_id1)
          puts "Enter second Customer_id"
          cus_id2=gets.chomp.to_i
          if Checker.check(cus_id2) 
              if cus_id1 != cus_id2
                puts "Enter Amount"
                amount=gets.chomp.to_i
                raise if amount<=0
                 Operation.to_transfer(cus_id1,cus_id2,amount)
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


end