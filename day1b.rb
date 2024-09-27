# Sanjay Adhith

# Singapore, Hillview

# Get your own puzzle input from the AoC website.

total_input = "onetwothreefourfive"

total_input = total_input.split("\n")

# This could be done much better with Knuth-Morris-Pratt.
# but the input size here is far too small for this to
# matter.

def silly_matcher(digit)
  decoder = {"one":  1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6,
             "seven": 7, "eight": 8, "nine": 9, "zero": 0, "1": 1, "2": 2,
             "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "0": 0}
  return decoder[:"#{digit}"]
end

p silly_matcher("one")
p silly_matcher("seven")
p silly_matcher("two")

puzzle_input="onetwone"

def line_reader(puzzle_input)
  greatest_hits = puzzle_input.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|0|1|2|3|4|5|6|7|8|9))/)
  first_digit = greatest_hits[0][0]
  last_digit = greatest_hits[-1][0]
  p puzzle_input
  p greatest_hits
  p silly_matcher(first_digit) * 10 + silly_matcher(last_digit)
  return silly_matcher(first_digit) * 10 + silly_matcher(last_digit)
end


sum = 0
for i in total_input
  sum += line_reader(i)
end 

p sum
