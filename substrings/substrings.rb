# frozen_string_literal: true

def substrings(string, dictionary)
  string = string.downcase.split(' ')

  dictionary.each_with_object(Hash.new(0)) do |value, hash|
    string.each do |item|
      hash[value] += 1 if item.include?(value)
    end
  end
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
puts substrings('below', dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
