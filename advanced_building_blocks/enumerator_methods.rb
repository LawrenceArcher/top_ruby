module Enumerable
	def my_each
		arr = self
		arr.length.times do |x|
			yield self[x]
		end
	end

	def my_each_with_index
		arr = self
		arr.length.times do |x|
			yield(arr[x], x)
		end
	end

	def my_select
		res = []
		self.my_each do |x|
			if yield (x)
				res.push(x)
			end
		end 
		res
	end

	def my_all?
		res = []
		self.length.times do |x|
			res.push(yield(self[x]))
		end
		if res.include? false
			false
		else
			true
		end
	end

	def my_any?
		self.length.times do |x|
			a = yield(self[x])
			if a==true
				return true
			end
		end
		false
	end

	def my_none?
		self.length.times do |x|
			a = yield(self[x])
			if a==true
				return false
			end
		end
		true
	end

	def my_count(*arg)
		puts "argument = #{arg}"
		count = 0
		if block_given? && arg.length != 0
			return "You fucked up dickface - 0 or 1 arguments, or a block"
		elsif block_given?
			self.my_each do |x|
				if yield(x)
					count+=1 
				end
			end
		elsif arg.length == 1
			self.my_each do |x|
				if x == arg
					 count+=1
				end
			end
		elsif arg.length == 0
			count = self.length
		else
			return "You fucked up dickface - 0 or 1 arguments, or a block"
		end

		count
	end

	def my_map
		puts block_given?
		res = []
		self.length.times do |x|
			res.push(yield(self[x]))
		end
		res
	end

	def my_inject(*arg)
		res = self[0]
		if block_given?
			if arg.length == 0
				self.shift
				self.length.times do |x|
					res = yield(res, self[x])
				end
			elsif arg.length == 1
				self.shift
				self.push(arg[0])
				self.length.times do |x|
					res = yield(res, self[x])
				end
			else
				return "wrong number of arguments, dickface"
			end
		else
			if arg.length == 1
				self.shift
				self.length.times do |x|
					res = eval ("#{res} #{arg[0]} #{self[x]}")
				end
			elsif arg.length == 2
				self.shift
				self.push(arg[0])
				self.length.times do |x|
					res = eval("#{res} #{arg[1]} #{self[x]}")
				end
			else
				return "wrong number of arguments, dickface"
			end
		end
		res
	end
end

longest = %w{ cat sheep bear }
arr = [2,3,10,4,5,6]

a = Proc.new{|x| x*2}
b = arr.my_map(&a)
print b