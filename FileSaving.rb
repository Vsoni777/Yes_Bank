module Save
  FILE_PATH = './file.txt' # File path for saving the hash

 
  # Method to save the hash as key=value pairs in the file
  def self.to_save(hash_value)
    File.open(FILE_PATH, 'w+') do |f|
      hash_value.each do |element|
        element.each do |key,value|
        f.puts("#{key}=#{value}") # Write key-value pair in the format key=value
        end
      end
    end
  end

  # Method to load the hash from the file
  def load
    data = {}
    File.open(FILE_PATH, 'r') do |f|
      f.each_line do |line|
        key, value = line.chomp.split('=', 2) # Split the line at the first '='
        data[key] = value.to_i # Convert the value to an integer (optional)
      end
    end
    data
  end

  def process
    catalogue = load
    p catalogue

  end
end


