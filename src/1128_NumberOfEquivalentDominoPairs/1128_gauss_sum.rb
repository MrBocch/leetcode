# @param {Integer[][]} dominoes
# @return {Integer}
def gauss_sum(n)
    return (n * (n+1) / 2)
end
def num_equiv_domino_pairs(dominoes)
    dominoes.map(&:sort).tally.reduce(0){|acc, (k,v)| acc + gauss_sum(v-1)}
end
