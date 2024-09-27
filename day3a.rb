# Sanjay Adhith

# Singapore, Hillview

# For this puzzle, let's take an approach that I learnt while
# studying probability : taking the compliment.

# We search for numbers which _aren't_ surrounded by a
# symbol and tally them up.

# Then we just add up all the numbers with some reg-exp
# and then subtract the tally.

input_sequence = "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.."

input_sequence = input_sequence.split("\n").map { |x| x.split("")}
# p input_sequence

# To avoid the ugly edge cases when doing diagonal scanning,
# we are going to pad the data, a clasic trick used by the folks
# working with computer vision and chess engines.

# https://stackoverflow.com/questions/62607613/is-there-a-better-way-to-scan-the-surrounding-elements-of-every-element-in-a-2d

dummy = [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]
input_sequence = input_sequence.map { |x| x.insert(0, ".").append(".")}.insert(0, dummy).append(dummy)
# p input_sequence

# Now we just need to scan within the boundaries.
# Would Knuth-Morris-Pratt even be helpful in this problem?

for i in input_sequence
  p i
end

