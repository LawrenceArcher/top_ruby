dictionary = File.open("./5desk.txt", "r").to_a

def start_game
    @computer_word = ''
    @human_visible_word = ''
    @round = 1
    unless (@computer_word.length >= 5 && @computer_word.length <= 12)
        puts 'Picking word'
        @computer_word = dictionary.sample
    end
end

def display_word
    @computer_word.length.times do
        print '_ '
    end
end



# puts 'Here is your word'
# puts @human_visible_word

def guess
    puts "This is round #{@round}. Please guess the word. Enter underscores where you don't know the letter."
    display_word
    puts @human_visible_word
    input = gets.chomp
    if input == @computer_word
        puts "Well done you have won in #{@round} rounds!"
    elsif input.length != @computer_word
        puts "Sorry that isn't the right length"
        guess
    else
        @round += 1
        puts "Here is your current word:"
        display_word
    end
end

guess()

#need to write logic to check whether a character was guess correctly
#could be done by splitting into array and checking against computer_word
#need to make sure to compare human's new entry against the last human_visible_word stored
#then need to update human_visible_word with the changes to the word
#if guess > 8 then game over.
