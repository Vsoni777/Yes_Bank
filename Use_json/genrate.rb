require 'json'

# Create some data to be written to the JSON file
data_to_write = {
  "name" => "John",
  "age" => 30,
  "city" => "New York"
}

json_data = JSON.generate(data_to_write)

file_path = 'new_file.json'
File.open(file_path, 'w') do |file|
  file.write(json_data)
end

puts "Data has been written to #{file_path}"