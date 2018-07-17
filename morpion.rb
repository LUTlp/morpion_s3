require 'pry'

class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
      attr_accessor :status, :value

  def initialize
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @status = ''
    @value = value
  end

  def to_s
    #TO DO : doit renvoyer la valeur au format string
  end

end

class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
    attr_accessor :board

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @case1 = BoardCase.new
    @case2 = BoardCase.new
    @case3 = BoardCase.new
    @case4 = BoardCase.new
    @case5 = BoardCase.new
    @case6 = BoardCase.new
    @case7 = BoardCase.new
    @case8 = BoardCase.new
    @case9 = BoardCase.new

    @board = [@case1, @case2, @case3, @case4, @case5, @case6, @case7, @case8, @case9]
  end

  def to_s
  #TO DO : afficher le plateau
   puts "#{case1.to_s}| #{case2.to_s} |#{case3.to_s}"
   puts "---------"
   puts "#{case4.to_s}| #{case5.to_s} |#{case6.to_s}"
   puts "---------"
   puts "#{case7.to_s}| #{case8.to_s} |#{case9.to_s}"
  end

  def play(player_move, player)
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    @board[player_move] = player.user_symbol
    check_victory
  end

  def victory_conditions
    [@case1, @case2, @case3]
    [@case4, @case5, @case6]
    [@case7, @case8, @case9]
    [@case1, @case4, @case7]
    [@case2, @case5, @case8]
    [@case3, @case6, @case9]
    [@case7, @case5, @case3]
    [@case1, @case5, @case9]
  end

  def check_victory
    #TO DO : qui gagne ?
    victory_conditions.each do |conditions|
      if conditions[0] == "#{user_symbol}" && conditions[1] == "#{user_symbol}" && conditions[2] == "#{user_symbol}"
        puts "#{player_name} win"
        exit
      end
    end
  end
end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
    attr_accessor :player_name, :user_symbol
  def initialize(player_name, user_symbol)
    #TO DO : doit régler son nom, sa valeur, son état de victoire
    @player_name = player_name
    @user_symbol = user_symbol
  end
end

class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "Player 1, what's your name ?"
    player1_name = gets.chomp
    puts "#{player1_name}, your symbol is x"
    puts
    user_symbol = "x"
    @player1 = Player.new("#{player1_name}", "x")
    #on a crée un attribut joueur qui se réfère à la class Player et qui va utiliser pour pouvoir être appelé les 2 paramètres cités
    puts "Player 2, What's your name ?"
    player2_name = gets.chomp
    puts "#{player2_name}, your symbol is o"
    puts
    user_symbol_2 = "o"
    @player2 = Player.new("#{player2_name}", "o")
    @board = Board.new
      @players = [@player1, @player2]
  end

  def go
    # TO DO : lance la partie
    self.turn

    #on créé un array pour pouvoir ensuite les appeler dans nos boucles de jeu


    @board.to_s #méthode de classe ?
  end

  #TO DO : affiche le plateau, demande au joueur ce qu"il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  def turn
    # vérifier victoire => choix => on vérifie que la case est vide => on remplit le tableau => on montre le tableau
    i = 0
    while i<9
      if i.even?
        player_i = @player2
      else player_i = @player1
      end
      puts "#{player_i.player_name}, which case will you play ? [1-9]"
      player_move = gets.chomp.to_i - 1
      @board.play(player_move, player_i)
      @board.to_s
    check_victory(player_name, user_symbol)

    end
  end

end


Game.new.go
