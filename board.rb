class Board

  BOARD_MAX_INDEX = 3
  attr_reader :board

  def initialize()
   @board = Array.new(BOARD_MAX_INDEX){Array.new(BOARD_MAX_INDEX)}
  end

  def cell_content(row, col)
      cell_content = @board.fetch(row).fetch(col)
  end

  def display_board
    puts @board.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
  end

  def validates_and_draw_cell(current_player, row, col)
    validate = true
    begin
      cell_content = @board.fetch(row).fetch(col)
    rescue IndexError
      validate = false
      puts "Out of bounds, try another position"
    end

    if cell_content
      validate = false
      puts "Cell occupied, try another position"
    end

    if validate
      @board[row][col] = current_player
    end

    validate
  end

  def full?
    @board.flatten.compact.length == BOARD_MAX_INDEX * BOARD_MAX_INDEX
  end

end
