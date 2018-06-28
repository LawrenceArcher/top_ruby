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
	
	def player_move (y, x)
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
			move(@comp_symbol, y_coord, x_coord)
		end
	end
end

def startGame
	moves = 0
	puts "What symbol would you like to play as?"
	s = gets.chomp
	s == "X" ? comp_s = "O": comp_s = "X"
	puts comp_s
	game_finished = false
	game = Game.new(s)
	while moves < 9 && game_finished == false
		if moves == 0
			game.show_board
		end
		puts "Your turn"
		puts "Coordinates are 0-2 on the x-axis and 0-2 on the y-axis, inputted as such: '1,2'"
		player_input = gets.strip.split(",")
		puts "moves = #{moves}"
		if game.check[player_input[1].to_i][player_input[0].to_i] != " "
			puts "That cell is already taken"
			redo
		else
			game.player_move(player_input[1].to_i, player_input[0].to_i) 
			moves +=1
			if (
				game.check[0][0] == s && game.check[0][1] == s && game.check[0][2] == s ||
				game.check[1][0] == s && game.check[1][1] == s && game.check[1][2] == s ||
				game.check[2][0] == s && game.check[2][1] == s && game.check[2][2] == s ||
				game.check[0][0] == s && game.check[1][1] == s && game.check[2][2] == s ||
				game.check[0][0] == s && game.check[1][0] == s && game.check[2][0] == s ||
				game.check[0][1] == s && game.check[1][1] == s && game.check[2][1] == s ||
				game.check[0][2] == s && game.check[1][2] == s && game.check[2][2] == s ||
				game.check[2][0] == s && game.check[1][1] == s && game.check[0][2] == s
				)
				puts "you win you clever some of a bitch"
				return
			end
			if moves > 8 
				puts "game over - it's a draw"
				return
			end
		end
		game.computer_move
		moves +=1
		if (
			game.check[0][0] == comp_s && game.check[0][1] == comp_s && game.check[0][2] == comp_s ||
			game.check[1][0] == comp_s && game.check[1][1] == comp_s && game.check[1][2] == comp_s ||
			game.check[2][0] == comp_s && game.check[2][1] == comp_s && game.check[2][2] == comp_s ||
			game.check[0][0] == comp_s && game.check[1][1] == comp_s && game.check[2][2] == comp_s ||
			game.check[0][0] == comp_s && game.check[1][0] == comp_s && game.check[2][0] == comp_s ||
			game.check[0][1] == comp_s && game.check[1][1] == comp_s && game.check[2][1] == comp_s ||
			game.check[0][2] == comp_s && game.check[1][2] == comp_s && game.check[2][2] == comp_s ||
			game.check[2][0] == comp_s && game.check[1][1] == comp_s && game.check[0][2] == comp_s
			)
			puts "you lost against an AI with the ability of a 2 week old baby you r-tard"
			return
		end
	end
end

startGame

