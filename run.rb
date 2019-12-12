#!/usr/bin/ruby

require './lib/sliding_puzzle.rb'

puts "", "Create standard solvable 15 puzzle and test for solvability"
solvable_puzzle = SlidingPuzzle.new(:width => 4, :height => 4,
                                    :board => [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0])
solvable_puzzle.is_solvable?(:verbose => TRUE)
solvable_puzzle.print_board

puts "", "Create standard unsolvable 15 puzzle and test for solvability"
unsolvable_puzzle = SlidingPuzzle.new(:width => 4, :height => 4,
                                      :board => [1,2,3,4,5,6,7,8,9,10,11,12,13,15,14,0])
unsolvable_puzzle.is_solvable?(:verbose => TRUE)
unsolvable_puzzle.print_board

puts "", "Create random 15 puzzle and test for solvability"
random_puzzle = SlidingPuzzle.new
random_puzzle.shuffle_board
random_puzzle.is_solvable?(:verbose => TRUE)
random_puzzle.print_board