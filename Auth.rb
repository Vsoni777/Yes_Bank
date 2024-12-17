class Auth 
  attr_accessor :email,:passsword
  def initialize(email,passsword)
    @email=email
    @passsword=passsword
  end
end