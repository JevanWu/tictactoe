require_relative 'game.rb'

game = Game.new

players = [:X, :O].cycle

current_player = players.next 

loop do
  game.game_status
  game.round
  unless game.judge?(current_player)
    next
  end

  if game.has_winner?(current_player)
    puts "#{current_player} wins!"
    exit
  end

  if game.is_draw?
    puts "It's a draw!"
    exit
  end

  current_player = players.next 
end
