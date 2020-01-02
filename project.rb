def caesar_cipher(message, key=0)
  message.length.times do |i| 
    if message[i].between?("a","z")
      message[i] = ((((message[i].ord - "a".ord) + key) % 26) + "a".ord).chr
    elsif message[i].between?("A","Z")
      message[i] = ((((message[i].ord - "A".ord) + key) % 26) + "A".ord).chr
    end
  end
  return message
end

def stock_picker(stock_prices)
  # find the greatest difference between an element and some element further into the array
  greatest_difference = 0;
  greatest_difference_at = [0,1]
  stock_prices.length.times do |i|
    (stock_prices.length - (i + 1)).times do |j|
      if stock_prices[i + j] - stock_prices[i] > greatest_difference
        greatest_difference = stock_prices[i + j] - stock_prices[i]
        greatest_difference_at = [i,i + j]
      end
    end
  end
  return greatest_difference_at
end

def substrings(msg, dictionary)
  substrings = {}
  dictionary.each do |word|
    substrings[word.to_sym] = 0
  end
  msg.downcase.gsub(/[^a-zA-Z\s]+/,"").split(" ").each do |word|
    if !substrings[word.to_sym].nil?
      substrings[word.to_sym] += 1
    end
  end
  return substrings
end

# puts caesar_cipher("What a string!", 5)
# puts stock_picker([17,3,6,9,15,8,6,1,10])



dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)

