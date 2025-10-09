# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
    dominoes.map(&:sort).tally.reduce(0){|acc, (k,v)| acc + (1...v).sum}
end