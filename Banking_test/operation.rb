require 'minitest/autorun'

require_relative '../checker'
require_relative '../operation'

require_relative '../dummy'
require_relative '../tranaction'

class OperationTest < Minitest::Test 
   def setup
     @account=Dummy.to_give_dummydata
   end

   def test_is_not_empty
     refute @account.empty?,"accounts should not be empty"
   end

   def test_account_is_exist_not
     assert_equal 101,@account[1][:acc_no]
   end

   def test_account_value
     assert_includes(@account.values,@account[7],"hash set is not exist")
   end

   def test_creditoperation
     assert_equal 1,@account[1][:customer_id]
   end
end