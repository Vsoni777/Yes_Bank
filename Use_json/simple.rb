require 'json'
def save_data()
  #create file and give authoritize to perform task on that fuke
file=File.open('new_file.json','w+')
str = '{"a": "foo", "b": 1, "c": 1.0, "d": 2.0e2, "e": true, "f": false, "g": null}'
hash={foo: "xys"}
#convert Json Object
new_str=JSON.parse(str)
file.write(new_str)
# puts "data save"
file.close
end

def print_data
  file_path = 'new_file.json'
json_data = File.read(file_path)
  json_data=File.read('new_file.json')
  parse_data=JSON.parse(json_data)
  p parse_data.inspect
end

print_data

