# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone_number)
  phone_number.gsub!(/\D/, '')
  case phone_number.length
  when 10
    phone_number
  when 11
    phone_number[0] == '1' ? phone_number[1..] : 'Invalid'
  else
    'Invalid'
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
hours = Hash.new(0)
days = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phone_number(row[:homephone])
  legislators = legislators_by_zipcode(zipcode)
  reg_date = row[:regdate]
  reg_time = Time.strptime(reg_date, '%m/%d/%y %H:%M')
  hours[reg_time.hour] += 1
  days[reg_time.wday] += 1
  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end

peak_h = hours.max_by { |_hour, count| count }[0]
peak_d = Date::DAYNAMES[days.max_by { |_day, count| count }[0]]

puts "#{peak_d} #{peak_h}"
code
