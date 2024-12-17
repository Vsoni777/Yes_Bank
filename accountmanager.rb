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
    account=
    {
      acc_no: account.acc_no,
      name: account.name,
      ph_no: account.ph_no,
      acc_type: account.type,
      balance: account.balance,
      email: account.auth.email,
      passsword: account.auth.passsword
    } 
    print account[:passsword]
    return account
  end




  def self.display(acc)
    acc.each do |account|
    puts "Account no: #{account[:acc_no]}"
    puts "Account no: #{account[:name]}"
    puts "Account no: #{account[:ph_no]}"
    puts "Account no: #{account[:acc_type]}"
    puts "Account no: #{account[:balance]}"
    puts "Account no: #{account[:email]}"
    puts "Account no: #{account[:passsword]}"
   end
  end

  ##to store value
  def self.register(account)
    acc<<account
    return acc
  end

end