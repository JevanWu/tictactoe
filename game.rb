require_relative 'board.rb'

class Game

  def initialize()
    @board = Board.new
  end

  def round
    print "\n>> "
    @row, @col = gets.split.map{|e| e.to_i}
  end

  def judge?(current_player)
    @board.validates_and_draw_cell(current_player, @row, @col)
  end

  def game_status
    @board.display_board 
  end

  def has_winner?(current_player)
    left_diagonal = [[0,0],[1,1],[2,2]]
    right_diagonal = [[2,0],[1,1],[0,2]]
    
    lines = []
    
    [left_diagonal, right_diagonal].each do |line|
      lines << line if line.include?([@row, @col])
    end

    lines << (0..2).map { |c1| [@row, c1] }
    lines << (0..2).map { |r1| [r1, @col] }

    win = lines.any? do |line|
      line.all? { |row,col| @board.cell_content(row, col) == current_player }
    end
  end

  def is_draw?
    puts "It's a draw!" if @board.full?
  end
end

