class SlidingPuzzle
  attr_reader :width, :height, :board

  def initialize(width: 4, height: 4, board: Array.new)
    @width, @height = width, height
    if board.length == 0
      @board = board ||= Array.new(@width * @height)
      populate_board
    else
      @board = board
    end
  end

  def populate_board
    tiles = @width * @height
    (0..tiles-1).each do |index|
      @board[index] = index
    end
    
    @board << @board.shift
  end

  def shuffle_board
    hold = @board.pop
    @board.shuffle! << hold
  end

  def count_inversions
    inversion_count = 0
    n = @board.length - 1
    
    (0..n - 1).each do |i|
      (i + 1..n).each do |j|
        inversion_count += 1 if @board[i] > @board[j] && @board[j] != 0
      end
    end

    return inversion_count
  end

  def is_solvable?(verbose: FALSE)
    inversion_count = count_inversions
    
    if inversion_count.even?
      puts "The puzzle is solvable." if verbose == TRUE
      return TRUE
    else
      puts "The puzzle is unsolvable." if verbose == TRUE
      return FALSE
    end
  end
  
  def print_board
    two_d_board = @board.each_slice(@width).to_a
    
    width = two_d_board.flatten.max.to_s.size + 2

    puts "Sliding Puzzle Board:"
    puts two_d_board.map { |a| a.map { |i| i.to_s.rjust(width) }.join }
  end
end
