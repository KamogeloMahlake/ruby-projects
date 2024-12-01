require_relative 'lib/read_files'
require 'json'
require 'erb'
#data = Readfile.new('./json_file/response_1732603314397.json').content

#hash =  JSON.parse(data)

#puts hash[0]["id"]
Readfile.new('./json_file').write_html('form_letter.erb')