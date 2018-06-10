def stock_picker (arr)
	total_diff = 0
	index_one = 0
	index_two = 0
	arr.each_with_index{|x, index|
		x_index = index + 1
		arr[index..-1].each_with_index{|y, index|
			y_index = index + x_index
			diff = y - x
			if diff > total_diff
				total_diff = diff
				index_one = x_index
				index_two = y_index
			end
		}
	
	}
	puts "Make " + total_diff.to_s + " dollars by buying on day " + index_one.to_s + " and selling on day " + index_two.to_s

end


stock_picker([15,12,10,9,10,10,10,10])