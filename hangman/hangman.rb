dictionary = File.open("./5desk.txt", "r").to_a

@computer_word = ''
@human_visible_word = ''
@round = 0

unless (computer_word.length >= 5 && @computer_word.length <= 12)
    puts 'Picking word'
    @computer_word = dictionary.sample
    @computer_word.length.times do
        @human_visible_word << '_ '
    end
end

# puts 'Here is your word'
# puts @human_visible_word

def guess
    @round += 1
    puts "This is round #{@round}. Please guess the word. Enter underscores where you don't know the letter."
    puts @human_visible_word
    input = gets.chomp
    if input == @computer_word
        puts "Well done you have won in #{@round} rounds!"
    else
        puts "Here is your current word:"
        puts @human_visible_word
    end
end

guess()

#need to write logic to check whether a character was guess correctly
#could be done by splitting into array and checking against computer_word
#need to make sure to compare human's new entry against the last human_visible_word stored
#then need to update human_visible_word with the changes to the word
#if guess > 8 then game over.
