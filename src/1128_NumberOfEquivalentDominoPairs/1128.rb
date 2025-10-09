# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
    dominoes.map{|row| row.sort}.tally.map{|k,v| (1...v).sum}.sum 
end