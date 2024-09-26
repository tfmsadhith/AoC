# Sanjay Adhith

# Singapore, Hillview

# Get your own puzzle input from the AoC website.

total_input = "B3w4re the beast
w1th just 0ne
3y3! YR00!"

total_input = total_input.split("\n")

def line_reader(puzzle_input)
  digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  puzzle_input = puzzle_input.split('')
  store = []
  for i in puzzle_input do
     if digits.include? i then
       store.append(i)
     end           
  end
    return store[0].to_i * 10 + store[-1].to_i
end

sum = 0
for i in total_input
  x = i
  sum += line_reader(x)
  p line_reader(x)
end 

p sum 
