require_relative 'tranaction'
module Operation 
   #Method for credit
  def self.credit(customer_id,amount,accounts)
    accounts[customer_id][:balance]+=amount
    History.add_method(customer_id,accounts[customer_id])
  end

  #method for debit
  def self.debit(customer_id,amount,accounts)
    if amount<accounts[customer_id][:balance]
    accounts[customer_id][:balance]-=amount
    else
      puts "Insufficent balance"
    end
    History.add_method(customer_id,accounts[customer_id])
  end


  def self.to_transfer(customer_id,cus_id2,amount,accounts)
    debit(customer_id,amount,accounts)
    credit(cus_id2,amount,accounts)
    History.add_method(cus_id2,accounts[cus_id2])
    History.add_method(customer_id,accounts[customer_id])
  end

  #method for display current use
  def self.display(customer_id,accounts)
   details= accounts[customer_id]
   if details
     puts "------------------------------"
     puts "Account Customer_id:  #{details[:customer_id]}"
     puts "Account no: #{details[:acc_no]}"
     puts "Account no: #{details[:name]}"
     puts "Account no: #{details[:ph_no]}"
     puts "Account no: #{details[:acc_type]}"
     puts "Account no: #{details[:balance]}"
   else
    puts "Record not found"
   end

  end

  
end
