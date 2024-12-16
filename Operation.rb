module Operation 
   attr_accessor :amount
  def credit(account_holder)
    puts "current balance is: #{account_holder.balance}"
    puts "Enter Amount of Balance"
    balance=gets.chomp.to_i
    account_holder.balance=balance
    account_holder
  end

  def debit(account_holder)
    puts "Current balance is : #{account_holder.balance}"
    puts "Enter Debit amount: "
    amount=gets.chomp.to_i
    account_holder.balance=amount
  end

  def display(account_holder)
    
  end
end
