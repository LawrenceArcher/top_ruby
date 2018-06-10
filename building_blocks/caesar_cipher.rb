def caesar_cipher (str, num)
	arr = str.split(//)
	key_codes = []
	final_array = []
	arr.each {|x|
		y = x.to_s.ord
		key_codes.push(y)
	}
	key_codes.each {|y|
		if y>=65 && y<=90
			y+=num
			if y >90
				y-=26
			end
		end
		if y>=97 && y<=122
			y+=num
			if y >122
				y-=26
			end
		end
		final_array.push(y.chr)
	}
	puts final_array
end

caesar_cipher("Hello, friend", 5)