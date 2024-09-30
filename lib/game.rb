require_relative 'state'

class Game
  def initialize()
    @state = State.new
  end

  def startGame()
    playerId = 1

    while true
      row = Integer(gets.chomp)
      col = Integer(gets.chomp)
      @state.insertSymbol(row, col, playerId)
      @state.printState
      if @state.playerWon?(playerId)
        puts "Player #{playerId} won!"
        return
      end
      playerId = playerId == 2 ? 1 : 2
    end
  end

end