def substring (str, dictionary)
	words = []
	arr = str.split(" ")
	arr.each{|word|
		dictionary.each{|x|
		 	if x.include?(word)
		 		words.push(x)
		 	end
		}
	}
	
	
	puts words
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


substring("go down below", dictionary)