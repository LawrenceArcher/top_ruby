module Enumerable
	# def my_each
	# 	arr = self
	# 	arr.length.times do |x|
	# 		yield (arr[x])
	# 	end
	# end

	def my_each_with_index
		arr = self
		index = 0
		arr.length.times do |x, index|
			yield (arr[x], index)
			index +=1
		end
	end
end

arr = [2,3,4]

arr.my_each_with_index {|x, index| puts x*2}

# arr.my_each_with_index do |x, index| 
# 	puts x*2
# 	puts "index = #{index}"
# end

# 3.times do |x|
# 	puts x
# end