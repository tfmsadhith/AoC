# Sanjay Adhith

# Singapore, Hillview

# This is yet another nasty parsing problem.
# Let's begin to wrangle it.

raw_input = "
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
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


  def good_show?(sample_input)
    max_blue = 1
    max_red = 1
    max_green = 1
    for showing in sample_input
      blue_count = 0
      red_count = 0
      green_count = 0
      for i in shows(showing)
          colour = show_split(i)[1] # https://tinyurl.com/mun7cuvk
          count = show_split(i)[0]
          if colour == "blue"
            blue_count = count.to_i
          elsif colour == "red"
            red_count = count.to_i
          else
            green_count = count.to_i
          end
      end
      if blue_count > max_blue
        max_blue = blue_count
      end
        
      if red_count > max_red
        max_red = red_count
      end
      
      if green_count > max_green
        max_green = green_count
      end
    end
    return max_blue * max_red * max_green
  end
  tally += good_show?(sample_input)
end

p tally
