class History
attr_accessor  :histroy_t

def initialize
 
  @histroy_t = Hash.new { |hash, key| hash[key] = [] }
 # Initialize history as an array to store multiple balance snapshots
end

# def self.history(customer)
#   puts "Enter amount"
#   amount = gets.chomp.to_i
#   hash_new,accounts = Operation.credit(customer, amount,accounts)
#   add_method(customer, hash_new)
#   accounts
# end

# def self.credit(customer, amount,accounts)
#   # Create a fresh copy of the customer's record each time this method is called
#   new_hash = accounts[customer].dup  # Use .dup to create a shallow copy

#   # Update the balance for the customer in the new_hash
#   new_hash[:balance] += amount
#    temp=new_hash[:balance]
#   accounts[customer][:balance]=temp
#   return new_hash,accounts
# end

def self.add_method(customer,hash_new)
  # Add the new record to the history for the given customer_id
  keyf=customer
  puts keyf
  p hash_new
  @histroy_t[keyf]=(hash_new)  # Use '<<' to append the new snapshot to history
end

def self.display_history(customer)
  return history_t{customer}
end
end

# Creating an instance of His class and calling the history method


# Output the history_t to check the results
