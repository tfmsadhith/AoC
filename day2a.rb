# Sanjay Adhith

# Singapore, Hillview

# This is yet another nasty parsing problem.
# Let's begin to wrangle it.

raw_input = "
Game 1: 7 green, 4 blue, 3 red; 4 blue, 10 red, 1 green; 1 blue, 9 red
Game 2: 2 red, 4 blue, 3 green; 5 green, 3 red, 1 blue; 3 green, 5 blue, 3 red
Game 3: 12 red, 1 blue; 6 red, 2 green, 3 blue; 2 blue, 5 red, 3 green
Game 4: 3 green, 1 red, 3 blue; 1 red; 2 green, 1 red, 1 blue; 3 green, 1 blue; 2 blue; 2 green, 4 blue
8 red
"

raw_input = raw_input.split("\n").drop(1)

# We don't need to maintain any running tallies or anything
# like that, we just need to check that each time the elf
# flashes us his balls he doesn't show us anything inappropriate. 

tally = 0

for sample_input in raw_input
  sample_input = sample_input.split(/:|;/)
  game_code = sample_input[0]
  sample_input = sample_input.slice!(1..)

  # We just need to check that the count doesn't
  # exceed for each colour in a showing.

  def shows(showing)
    return showing.split(",")
  end

  def show_split(show)
    return show.split(" ")
  end


  def good_show?(sample_input, max_blue, max_red, max_green)
    for showing in sample_input
      blue_count = 0
      red_count = 0
      green_count = 0
      for i in shows(showing)
          colour = show_split(i)[1] # https://tinyurl.com/mun7cuvk
          count = show_split(i)[0]
          if colour == "blue"
            blue_count += count.to_i
          elsif colour == "red"
            red_count += count.to_i
          else
            green_count += count.to_i
          end
      end
      if blue_count > max_blue
         return false
      elsif red_count > max_red
        return false
      elsif green_count > max_green
        return false
      end
  end
  return true
  end
  if good_show?(sample_input, 14, 12, 13)
    tally += game_code.gsub(/[^\d]/, '').to_i
  end
  
end

p tally
