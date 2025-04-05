# paragragh= "What is Lorem Ipsum?\n"+
#          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n"+
#          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,\n"+
#         "when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n"+
#         "It has survived not only five centuries, but also the leap into electronic typesetting,\n"+
#         "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset\n"+
#         " sheets containing Lorem Ipsum passages, and more recently with desktop publishing software \n"+
#         "like Aldus PageMaker including versions of Lorem Ipsum.\n"
# File.open('sample.txt','w') do |file|
#   file.puts paragragh
# end
# 
require 'fileutils'
 FileUtils.mkdir('new_sector')
 FileUtils.copy('sample.txt','new_sector')
# puts ('new_sector/sample.txt')