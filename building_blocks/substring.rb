def substring (str, dictionary)
	words = Hash.new
	arr = str.split(" ")
	arr.each{|word|
		dictionary.each{|x|
		 	if x.include?(word)
		 		if words[x]
		 			words[x] += 1
		 		else
		 			words[x] = 1
		 		end
		 	end
		}
	}
	
	
	puts words
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


substring("go down below go", dictionary)