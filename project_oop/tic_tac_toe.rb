class Game
	attr_accessor :board
	attr_accessor :symbol

	def initialize(symbol)
		@board = [
			[" "," "," "],
			[" "," "," "],
			[" "," "," "]
		]
		@symbol = symbol.upcase
		if @symbol == "X"
			@comp_symbol = "O"
		else
			@comp_symbol = "X"
		end
	end
	
	def check
		@board
	end
	
	def show_board
		print "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}
#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}
#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}\n"
	end

	def move(sym, y_coord, x_coord)
		@board[y_coord][x_coord] = sym
		show_board
	end
	
	def player_move (x, y)
		x_coord = x
		y_coord = y
		move(@symbol, y_coord, x_coord)
	end

	def computer_move
		x_coord = rand(3)
		y_coord = rand(3)
		if @board[y_coord][x_coord] != " "
			puts "blocked! x = #{x_coord} and y = #{y_coord}"
			computer_move
		else
			move(@comp_symbol, x_coord, y_coord)
		end
	end
end

def startGame
	moves = 0
	puts "What symbol would you like to play as?"
	symbol = gets.chomp
	game_finished = false
	game = Game.new(symbol)
	while moves < 9 && game_finished == false
		if moves == 0
			game.show_board
		end
		puts "Your turn"
		puts "Coordinates are 0-2 on the x-axis and 0-2 on the y-axis, inputted as such: '1,2'"
		player_input = gets.strip.split(",")
		if game.check[player_input[1].to_i][player_input[0].to_i] != " "
			puts "That cell is already taken"
			redo
		else
			game.player_move(player_input[0].to_i, player_input[1].to_i) 
			moves +=1
		end
		game.computer_move
		moves +=1
	end
end

startGame

