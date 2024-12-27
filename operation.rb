
module Operation 
   #Method for credit

  def self.credit(customer_id,amount)
    $accounts[customer_id][:balance]+=amount
    new_hash=hash_totranaction($accounts[customer_id],amount,'credited')
    History.add_method(customer_id,new_hash)
  end

  #method for debit
  def self.debit(customer_id,amount)
    if amount<$accounts[customer_id][:balance]
    $accounts[customer_id][:balance]-=amount
    else
      puts "Insufficent balance"
    end
    new_hash=hash_totranaction($accounts[customer_id],amount,'debited')
    History.add_method(customer_id,new_hash)
  end

  #fund transfer
  def self.to_transfer(customer_id,cus_id2,amount)
    to_hdebit(customer_id,amount,cus_id2)
    to_hcredit(cus_id2,amount,customer_id)
  end

  def self.to_hcredit(customer_id,amount,cus_id2)
    $accounts[customer_id][:balance]+=amount
    new_hash1=hash_totranaction($accounts[customer_id],amount,"Amount credited to #{cus_id2}")
    History.add_method(customer_id,new_hash1)
  end

  def self.to_hdebit(customer_id,amount,cus_id2)
    if amount<$accounts[customer_id][:balance]
      $accounts[customer_id][:balance]-=amount
      new_hash=hash_totranaction($accounts[customer_id],amount,"Amount debited successfully form #{cus_id2}")
      History.add_method(customer_id,new_hash)
    else
        puts "Insufficent balance"
    end 
  
  end

  #display history of account
  def self.display_histroy(customer_id)
    History.display_history(customer_id)
  end

  #method for display current use
  def self.display(customer_id)ay(customer_id)
    puts "hi #{customer_id}"
   details= $accounts[customer_id]
   if details
     puts "------------------------------"
     puts "Account Customer_id:  #{details[:customer_id]}"
     puts "Account no: #{details[:acc_no]}"
     puts "Account holder's name: #{details[:name]}"
     puts "Account holder's phone_no: #{details[:ph_no]}"
     puts "Account Type: #{details[:acc_type]}"
     puts "Account Current Balance: #{details[:balance]}"
   else
    puts "Record not found"
   end
  end


  def self.display
    $accounts.each do |key,details|
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
     account
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

  #convert hash value
  def self.to_save(account) 
    customer= account.customer_id
    temp=hash_register(account)
    $accounts.merge!(temp)
    credit(customer,$accounts[account.customer_id][:balance])
  end


  
end
