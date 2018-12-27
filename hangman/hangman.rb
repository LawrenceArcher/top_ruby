def start_game
    dictionary = File.open("./5desk.txt", "r").to_a
    @computer_word = ''
    @round = 1
    @guesses = ''
    unless (@computer_word.length >= 5 && @computer_word.length <= 12)
        puts 'Picking word'
        @computer_word = dictionary.sample.gsub(/\r\n/, '')
    end
    @human_visible_word = @computer_word.gsub(/\w/, '_')
    i = 1
    
    puts @computer_word.length
end

def display_word
    puts @human_visible_word
end

def guess
    i = 0
    count_correct = 0
    puts "This is round #{@round}. Please guess the word which contains #{@computer_word.length} letters. So far you have guessed #{@guesses}"
    display_word
    puts @human_visible_word
    input = gets.chomp
    @guesses << "#{input}, "
    for i in 0..@computer_word.length-1 do
        puts "i is equal to #{i}"
        if @computer_word[i].casecmp(input) == 0
            @human_visible_word[i] = input
            count_correct += 1
        end
    end
    if @human_visible_word.casecmp(@computer_word)
        puts "You have won the game - good job. The word was #{@computer_word}"
        return
    elsif count_correct > 0
        guess
    elsif @round == 8
        puts "You are now hanging. Game over! The word was #{@computer_word}"
        return
    else
        @round += 1
        guess
    end
end

start_game()
guess()

#need to write logic to check whether a character was guess correctly
#could be done by splitting into array and checking against computer_word
#need to make sure to compare human's new entry against the last human_visible_word stored
#then need to update human_visible_word with the changes to the word
#if guess > 8 then game over.
