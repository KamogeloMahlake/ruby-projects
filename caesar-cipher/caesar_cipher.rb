# frozen_string_literal: true

def caesar_cipher(string, number)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
  string = string.split('')
  output = ''

  string.each do |item|
    if alphabet.include?(item.downcase)
      index = alphabet.find_index(item.downcase) + number

      index -= 26 if index > 25
      output += if item == item.upcase
                  alphabet[index].upcase
                else
                  alphabet[index]
                end
    else
      output += item
    end
  end

  output
end

puts caesar_cipher('What a string!', 5)
