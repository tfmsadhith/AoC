# Sanjay Adhith

# Singapore, Hillview

rows="
"


def row_score(along_a_row) 
  row_parsed = along_a_row.split(":")[1].split("|").map {|x| x.split(" ")}

  winning = row_parsed[0]
  crib = row_parsed[1]

  tally = 0 
  our_numbers = winning.map {|x| tally += crib.count(x)}
  if tally != 0
    return 2 ** (tally - 1)
  end
  return 0
end

p (rows.split("\n").map {|x| row_score(x)}).sum()
