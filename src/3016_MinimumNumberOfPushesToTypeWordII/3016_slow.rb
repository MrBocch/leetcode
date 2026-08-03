# @param {String} word
# @return {Integer}
def minimum_pushes(word)
  cs   = word.chars
  digs = makeDig(cs.tally)
  
  cs.map{ |c| digs[c] }.sum
end

def makeDig(tally)
  dig = Hash.new(0)
  presses = 1
  count = 0
  while tally.size >= 1 do
    k, v = tally.max_by{|k, v| v }
    dig[k] = presses  
    count += 1
    presses += 1 if count % 8 == 0 
    tally.delete(k)
  end

  dig 
end