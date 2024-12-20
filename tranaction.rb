module History

  #add method to hash set
  def self.add_method(customer, hash_new)
    # Add the new record to the history for the given customer_id
    $histroy_t[customer] << hash_new 
    puts "Record for Customer ID #{customer} added to history."
  end

  #display histor of praticular acc
  def self.display_history(customer)
    # Display the history for a given customer_id
    if $histroy_t.key?(customer)
      puts "History for Customer ID #{customer}:"
      puts "Operation    "+"  |  "+"     Amount   "+" |  "+"    balance   "+"  |  "+"  time  "+"  |  "+"   |  "+"date"
      puts "--------------------------------------------"
       $histroy_t[customer].each do |details|
        puts "#{details[:operation]}"+"  |  "+"#{details[:amount]}"+"  |  "+"#{details[:balance]}"+"  |  "+" #{details[:time]}  "+" | "+"  #{details[:date]}"
    
        puts "------------------------------"
      end
    else
      puts "No history found for Customer ID #{customer}."
    end
  end

  #display clll detail
  def self.display_history_all
    if !$histroy_t.empty?
      $histroy_t.each do |key,detail|
        puts 
        puts "customer_Id:      #{key}"
      puts "Operation    "+"  |  "+"     Amount   "+" |  "+"    balance   "+"  |  "+"  time  "+"  |  "+"   |  "+"date"
      puts "--------------------------------------------"
        detail.each do |details|
       puts "#{details[:operation]}"+"  |  "+"#{details[:amount]}"+"  |  "+"#{details[:balance]}"+"  |  "+" #{details[:time]}  "+" | "+"  #{details[:date]}"
      end
    end
    else
      puts "No history found for Customer ID ."
    end  end
end

