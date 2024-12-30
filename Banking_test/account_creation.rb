require "minitest/autorun"
require_relative "../account_holder"
 require_relative "../checker"
class AccountTest < Minitest::Test
  @@acc=nil
    def self.setup_class
      @@acc = Account.new(0)  # Initialize account object
    end
  
    # Run class-level setup method only once
    def setup
      self.class.setup_class unless @@acc  # Only set up once
    end

  def test_invalid_name_input
    assert_equal "Vivek",@@acc.name
  end

  def test_invalid_phone_number
    assert_equal "784-258-3494",@@acc.ph_no
  end

  def test_invalid_account_type
    assert_equal "saving",@@acc.type
  end

  def test_balance_below_500
      assert_equal 1000,@@acc.balance
  end

  def test_account_number_generation
      assert_equal 101,@@acc.acc_no
  end

  def test_customer_id_generation
      assert_equal 1,@@acc.customer_id
  end
end

 