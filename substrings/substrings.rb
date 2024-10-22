def substrings(string, dictionary)
  string = string.downcase.split(" ")

  dictionary.reduce(Hash.new(0)) do |hash, value|
    string.each do|item| 
      if item.include?(value)
        hash[value] += 1
      end
    end 
    hash
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
