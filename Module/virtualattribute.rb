class Song 
  attr_accessor :first_name

  def call
    puts "#{first_name}  this is virtual attribute"
  end
end

asong=Song.new
asong.first_name="vivek"
asong.call