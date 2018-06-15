module Enumerable
	def my_each
		arr = self
		arr.length.times do |x|
			yield self[x]
		end
	end

	def my_each_with_index
		arr = self
		arr.length.times do |index|
			yield(arr[index], index)
		end
	end
end

# module Enumerable
# 	def my_each
# 		copy = self
# 		copy.length.times do |index|
# 			yield self[index]
# 		end
# 	end

# 	def my_each_with_index
# 		copy = self
# 		copy.length.times do |index|
# 			yield(copy[index], index)
# 		end
# 	end
#
# 	def my_select
# 		copy = self
# 		arr = []
# 		for element in copy
# 			if yield(element)
# 				arr.push(element)
# 			end
# 		end
# 		arr
# 	end
# 	def my_all?
# 		copy = self
# 		result = true
# 		for element in copy
# 			if !yield(element)
# 				result = false
# 			end
# 		end
# 		result
# 	end

# 	def my_any?
# 		self.each do |item|
# 			if yield
# 				return true
# 			end
# 		end
# 		false
# 	end

# 	def my_none?
# 		if self.length == 0
# 			true
# 		else
# 			false
# 		end
# 	end

# 	def my_count
# 		count = 0
# 		self.my_each do |element|
# 			if block_given?
# 				count += 1 if yield(item)
# 			else
# 				count += 1
# 			end
# 		end
# 		count
# 	end

# 	def my_map(proc=nil)
# 		mapped = []
# 		if proc != nil
# 			self.my_each do |item|
# 				mapped.push(proc.call(item))
# 			end
# 		else
# 			self.my_each do |item|
# 				mapped.push(yield(item))
# 			end 	
# 		end	
# 	end

# 	def my_inject(initial=0)
# 		result = 0
# 		if initial!= 0
# 			result = initial
# 		else
# 			result = self[0]
# 		end
# 		self.my_each do |item|
# 			yield(result, item)
# 		end
# 		result
# 	end
# end

arr = [2,3,4]

arr.my_each_with_index {|x, index| puts x.to_s + "  index: #{index}"}

# arr.my_each_with_index do |x, index| 
# 	puts x*2
# 	puts "index = #{index}"
# end

# 3.times do |x|
# 	puts x
# end