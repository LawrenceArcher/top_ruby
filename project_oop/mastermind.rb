class Game
	attr_reader :colours
	attr_reader :short_colours

	def initialize
		@colours = ["blue", "red", "green", "purple", "yellow", "orange"]
		@short_colours = ["b", "r", "g", "p", "y", "o"]
	end

	def computer_code
		@comp_arr = []
		i = 0
		while i < 4
			@comp_arr.push(short_colours[rand(6)])
			i += 1
		end
		print arr
	end

	def guess
		moves = 0
		puts "what is your guess? Enter with a space between each colour, choosing blue, red, green, purple, yellow and orange"
		@guess_arr = gets.downcase.split(" ")
		@guess_arr.each_with_index do |x, i|
			puts x
		end
	end
end