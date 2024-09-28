# Sanjay Adhith

# Singapore, Hillview

rows="Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"

# For this part, we need to do some has map shennanigans :(

# https://www.techotopia.com/index.php/Ruby_Variable_Scope

STORE = {}
p STORE

def row_score(along_a_row)
  along_a_row = along_a_row.split(":")
  head = along_a_row[0]
  card_number = head.split(" ")[1].to_i

  row_parsed = along_a_row[1].split("|").map {|x| x.split(" ")}
  
  winning = row_parsed[0]
  crib = row_parsed[1]

  tally = 0 
  our_numbers = winning.map {|x| tally += crib.count(x)}


  reps = 0 
  if STORE.key?(:card_number) then
    reps = STORE[:card_number]
  else
    reps = 1
  end
    
  for i in (card_number + 1)..(tally + 1) do
             if STORE.key?(i) then
               STORE[i] += 1 * reps
             else
               STORE[i] = 2 * reps# Add 1 for the basic run and another one for the copy.
             end
             
           end

  p STORE
  return tally
  
end

p (rows.split("\n").map {|x| row_score(x)}).sum()
