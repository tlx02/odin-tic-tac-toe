require_relative 'box'

class State
  def initialize()
    @table =  [
                [Box.new(), Box.new(), Box.new()],
                [Box.new(), Box.new(), Box.new()],
                [Box.new(), Box.new(), Box.new()]
              ]
  end

  def insertSymbol(row, column, symbol)
    box = @table[row][column]
    box.symbol = symbol
  end

  def playerWon?(playerId)
    return (@table.any? {|x| x.all? {|y| y.symbol == playerId}}) ||
       ([@table[0][0], @table[1][0], @table[2][0]].all? {|y| y.symbol == playerId}) ||
       ([@table[0][1], @table[1][1], @table[2][1]].all? {|y| y.symbol == playerId}) ||
       ([@table[0][2], @table[1][2], @table[2][2]].all? {|y| y.symbol == playerId}) ||
       ([@table[0][0], @table[1][1], @table[2][2]].all? {|y| y.symbol == playerId}) ||
       ([@table[0][2], @table[1][1], @table[2][0]].all? {|y| y.symbol == playerId})
  end

  def printState()
    @table.each {|row| row.each {|box| p box.symbol}}
  end

end