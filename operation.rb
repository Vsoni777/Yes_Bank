module Operation 
  
   #Method for credit
  def self.credit(account,op,accounts)
    puts "current balance is: #{account[:balance]}"
    puts "Enter Amount for credit"
    balance=gets.chomp.to_i
    account[:balance]+=balance
    return account
  end

  #method for debit
  def self.debit(account,op,accounts)
    puts "Current balance is : #{account[:balance]}"
    puts "Enter Debit amount: "
    amount=gets.chomp.to_i
    account[:balance]-=amount
    return account
  end

  #method for display current use
  def self.display(account,op)
    puts "Account no: #{account[:acc_no]}"
    puts "Account no: #{account[:name]}"
    puts "Account no: #{account[:ph_no]}"
    puts "Account no: #{account[:acc_type]}"
    puts "Account no: #{account[:balance]}"
    puts "Account no: #{account[:email]}"
    puts "Account no: #{account[:passsword]}"
  end
end
