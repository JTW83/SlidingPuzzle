require 'sliding_puzzle.rb'

describe "SlidingPuzzle" do
  it "creates sliding puzzle" do
    puzzle = SlidingPuzzle.new(:width => 4, :height => 4)
    expect(puzzle.width).to eq(4)
    expect(puzzle.height).to eq(4)
    expect(puzzle.board).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0])
  end
  
  it "shuffles board" do
    puzzle = SlidingPuzzle.new(:width => 4, :height => 4)
    puzzle.shuffle_board
    expect(puzzle.board.last).to eq(0)
    expect(puzzle.board.sort).to eq([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
  end
  
  it "counts inversions" do
    puzzle = SlidingPuzzle.new(:width => 4, :height => 4)
    expect(puzzle.count_inversions).to eq(0)

    puzzle = SlidingPuzzle.new(:width => 3, :height => 2, :board => [11, 15, 12, 10, 14, 0])
    expect(puzzle.count_inversions).to eq(5)
  end
  
  it "tests puzzle for solvability" do
    puzzle = SlidingPuzzle.new(:width => 4, :height => 4)
    expect(puzzle.is_solvable?).to eq(TRUE)
    
    puzzle = SlidingPuzzle.new(:width => 3, :height => 2, :board => [11, 15, 12, 10, 14, 0])
    expect(puzzle.is_solvable?).to eq(FALSE)
  end
end