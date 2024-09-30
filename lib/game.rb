require_relative 'state'

class Game
  def initialize()
    @state = State.new
  end

  def startGame()
    playerId = 1

    while true
      puts "Player #{playerId}'s turn! Your Move (ie '1,2'):"
      input = gets.chomp.split(',')
      row = Integer(input[0]) - 1
      col = Integer(input[1]) - 1

      @state.insertSymbol(row, col, playerId)
      @state.printState
      if @state.playerWon?(playerId)
        puts "Player #{playerId} won!"
        return
      end
      puts " "
      playerId = playerId == 2 ? 1 : 2
    end
  end

end