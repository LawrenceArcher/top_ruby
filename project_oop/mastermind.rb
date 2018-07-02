class Game
	attr_reader :colours
	attr_reader :computer_arr
	attr_accessor :guess_arr

	def initialize
		@colours = ["blue", "red", "green", "purple", "yellow", "orange"]
		@computer_arr = []
		i = 0
		while i < 4
			@computer_arr.push(@colours[rand(6)])
			i += 1
		end
	end

	def guess
		moves = 0
		puts "what is your guess? Enter with a space between each colour, choosing blue, red, green, purple, yellow and orange"
		@guess_arr = gets.downcase.split(" ")
		print "guess arr after requesting = #{@guess_arr}\n"
	end
end

def play_game
	game = Game.new
	@comp_arr = []
	move = 0
	while move < 12
		result_arr = []
		@comp_arr = game.computer_arr.clone
		puts "comp array = #{@comp_arr}"
		move += 1
		puts "Current move: #{move}"
		game.guess
		if game.guess_arr == game.computer_arr
			return
		else
			game.guess_arr.each_with_index do |x,i|
				if x.to_s == @comp_arr[i].to_s
					result_arr.push("black")
					game.guess_arr[i] = ""
					@comp_arr[i] = ""
				end
			end
			game.guess_arr.map{|x|
				x if x != ""
			}
			game.guess_arr.each_with_index do |x,i|
				if @comp_arr.include?(x)
					result_arr.push("white")
					game.guess_arr[i] = ""
					@comp_arr[@comp_arr.index(x)] = ""
				end
			end
		end
		puts result_arr.join(", ")
		if move == 12
			puts "You did not guess correctly. Game over."
		end
	end
end

play_game