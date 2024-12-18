module Dummy
  def self.to_give_dummydata
    return {1 => {:customer_id=>1, :acc_no=>101, :name=>"Vivek", :ph_no=>"777-385-3494", :acc_type=>"saving", :balance=>1000},
    2 => {:customer_id=>2, :acc_no=>102, :name=>"Aayush", :ph_no=>"781-388-3385", :acc_type=>"current", :balance=>15000},
    3 => {:customer_id=>3, :acc_no=>103, :name=>"Prince", :ph_no=>"781-388-3385", :acc_type=>"saving", :balance=>15000},
    4 => {:customer_id=>4, :acc_no=>104, :name=>"Shivam", :ph_no=>"781-388-3385", :acc_type=>"current", :balance=>15000},
    5 => {:customer_id=>5, :acc_no=>105, :name=>"Vishal", :ph_no=>"781-388-3385", :acc_type=>"saving", :balance=>15000},
    6 => {:customer_id=>6, :acc_no=>106, :name=>"Devesh", :ph_no=>"781-388-3385", :acc_type=>"current", :balance=>15000},
    7 => {:customer_id=>7, :acc_no=>107, :name=>"xyz", :ph_no=>"781-388-3385", :acc_type=>"saving", :balance=>15000}
    }
  end
end