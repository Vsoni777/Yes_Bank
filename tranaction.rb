$histroy_t = Hash.new { |hash, key| hash[key] = [] }
class History

  def self.add_method(customer, hash_new)
    # Add the new record to the history for the given customer_id
    $histroy_t[customer] << hash_new 
    puts "Record for Customer ID #{customer} added to history."
  end

  def self.display_history(customer)
    # Display the history for a given customer_id
    if $histroy_t.key?(customer)
      puts "History for Customer ID #{customer}:"
      p $histroy_t[customer]
    else
      puts "No history found for Customer ID #{customer}."
    end
  end

  def self.display_history_all
    if !$histroy_t.empty?
      puts "History for Customer ID :"
      p $histroy_t
    else
      puts "No history found for Customer ID ."
    end  end
end

