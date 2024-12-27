module CustomerDashBorad
 #Dashboard
 def self.dash_board(customer_id)
  puts "Welcome in user Dashborad........"
  puts customer_id
  begin
  loop do
   puts "Enter choice (1 -'Credit',2- 'debit',3 - 'fund transfer',4 -  'display', 5 -'history',6- 'close'): "
  puts "---------------------------------------------------------------"
  choice=gets.to_i
     case choice
     when 1
      puts "enter amount for Credit"
      amount=gets.chomp.to_i
      raise if amount<=0
      @account=Operation.credit(customer_id,amount)
     when 2
      puts "enter amount for Debit"
      amount=gets.chomp.to_i
      raise if amount<=0
      @account=Operation.debit(customer_id,amount)
     when 3
      puts "Could you enter second customer _id"
      # to check first
      cus_id2=gets.chomp.to_i
      if Checker.check(cus_id2) 
       if cus_id2!=customer_id
        puts "enter Amount"
         amount=gets.chomp.to_i
         raise if amount<=0
        Operation.to_transfer(customer_id,cus_id2,amount)
       else
         puts "you can't transfer your self"
       end
      else
        puts "Invalid is not exist"
      end
     when 4
          Operation.display(customer_id)
      # tendo_read_content
     when 5
      if Checker.check(customer_id)
        Operation.display_histroy(customer_id)
      else
        puts "worng customer id"
      end
     when 6
      puts "Exit----------------"
      # to_save_file
      break
     else
      puts "Invalid choice"
     end
   end
  rescue StandardError
   puts "Invalid Input"
  end
 end
end


