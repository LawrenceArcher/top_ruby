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
	comp_arr = game.computer_arr
	puts "initial set computer arr: #{comp_arr}"
	move = 0
	while move < 12
		result_arr = []
		puts "comp_arr = #{game.computer_arr}"
		comp_arr = game.computer_arr
		print "comp code initialised at start of while = #{comp_arr}\n"
		move += 1
		puts "MOVE = #{move}"
		game.guess
		if game.guess_arr == game.computer_arr
			puts "You have won after #{move} moves"
			return
		else
			game.guess_arr.each_with_index do |x,i|
				if x.to_s == comp_arr[i].to_s
					result_arr.push("black")
					game.guess_arr[i] = ""
					comp_arr[i] = ""
				end
			end
			game.guess_arr.map{|x|
				x if x != ""
			}
			puts "comp code after black check = #{comp_arr}"
			puts "guess arr after black check = #{game.guess_arr}"
			game.guess_arr.each_with_index do |x,i|
				if comp_arr.include?(x)
					result_arr.push("white")
					game.guess_arr[i] = ""
					comp_arr[comp_arr.index(x)] = ""
				end
			end
			puts "comp code after white check = #{comp_arr}"
			puts "guess arr after white check = #{game.guess_arr}"
		end
		puts result_arr.join(", ")
	end
end

play_game