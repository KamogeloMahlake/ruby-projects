def caesar_cipher(string, number)
  alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
  string = string.split("")
  output = ""

  string.each do |item|
    if alphabet.include?(item.downcase)
      index = alphabet.find_index(item.downcase) + number

      if index > 25
        index -= 26
      end
      if item == item.upcase 
        output += alphabet[index].upcase
      else
        output += alphabet[index]
      end
    else
      output += item
    end
  end
  
  return output
end

puts caesar_cipher("What a string!", 5)