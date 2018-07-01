class Game
	attr_reader :colours
	attr_accessor :comp_arr
	attr_accessor :guess_arr

	def initialize
		@colours = ["blue", "red", "green", "purple", "yellow", "orange"]
		@comp_arr = []
	end

	def computer_code
		@comp_arr = []
		i = 0
		while i < 4
			@comp_arr.push(@colours[rand(6)])
			i += 1
		end
		puts @comp_arr
	end

	def guess
		moves = 0
		puts "what is your guess? Enter with a space between each colour, choosing blue, red, green, purple, yellow and orange"
		@guess_arr = gets.downcase.split(" ")
		print "guess arr = #{@guess_arr}"
	end
end

def play_game
	game = Game.new
	game.computer_code
	move = 0
	while move < 12
		result_arr = []
		comp_code = game.comp_arr
		print "comp code = #{comp_code}\n"
		move += 1
		puts "move no. #{move}"
		game.guess
		if game.guess_arr == game.comp_arr
			puts "You have won after #{move} moves"
			return
		else
			game.guess_arr.each_with_index do |x,i|
				if x.to_s == comp_code[i].to_s
					result_arr.push("black")
					game.guess_arr[i] = ""
					comp_code[i] = ""
				end
			end
			puts "comp code after black check = #{comp_code}"
			puts "guess arr after black check = #{game.guess_arr}"
			game.guess_arr.each_with_index do |x,i|
				if comp_code.include?(x)
					result_arr.push("white")
					game.guess_arr.delete_at(i)
					comp_code.delete_at(comp_code.index(x))
				end
			end
		end
		puts result_arr.join(", ")
	end
end

play_game