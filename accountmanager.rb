module AccountManager
  

  #to create Speration
  # def self.store_detail(acc)
  #   put acc.name
  #   account=
  #   {
  #     acc_no: acc_no,
  #     name: name,
  #     ph_no: ph_no,
  #     acc_type: acc_type,
  #     balance: balance,
  #     email: email,
  #     passsword: password
  #   } 
  #   return account
  # end

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