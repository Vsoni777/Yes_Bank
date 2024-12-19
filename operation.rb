require_relative 'tranaction'
require_relative 'accountmanager'
module Operation 
   #Method for credit
   extend AccountManager
  def self.credit(customer_id,amount,accounts)
    accounts[customer_id][:balance]+=amount
    new_hash=AccountManager.hash_totranaction(accounts[customer_id],amount,'credited')
    History.add_method(customer_id,new_hash)
  end

  #method for debit
  def self.debit(customer_id,amount,accounts)
    if amount<accounts[customer_id][:balance]
    accounts[customer_id][:balance]-=amount
    else
      puts "Insufficent balance"
    end
    new_hash=AccountManager.hash_totranaction(accounts[customer_id],amount,'debited')
    History.add_method(customer_id,new_hash)
  end


  def self.to_transfer(customer_id,cus_id2,amount,accounts)
    to_hdebit(customer_id,amount,accounts,)
    to_hcredit(cus_id2,amount,accounts)
  end

  #method for display current use
  def self.display(customer_id,accounts)
   details= accounts[customer_id]
   if details
     puts "------------------------------"
     puts "Account Customer_id:  #{details[:customer_id]}"
     puts "Account no: #{details[:acc_no]}"
     puts "Account holder's name: #{details[:name]}"
     puts "Account no: #{details[:ph_no]}"
     puts "Account no: #{details[:acc_type]}"
     puts "Account no: #{details[:balance]}"
   else
    puts "Record not found"
   end
  end


  def self.to_hcredit(customer_id,amount,accounts)
    accounts[customer_id][:balance]+=amount
    new_hash1=AccountManager.hash_totranaction(accounts[customer_id],amount,'Amount credit')
    History.add_method(customer_id,new_hash1)
  end

  def self.to_hdebit(customer_id,amount,accounts)
    if amount<accounts[customer_id][:balance]
      accounts[customer_id][:balance]-=amount
      new_hash=AccountManager.hash_totranaction(accounts[customer_id],amount,'Amount debited successfully')
      History.add_method(customer_id,new_hash)
    else
        puts "Insufficent balance"
    end 
  
  end

  #display history of account
  def self.display_histroy(customer_id)
    History.display_history(customer_id)
  end

  
end
