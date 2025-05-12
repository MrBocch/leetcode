# @param {Integer[]} digits
# @return {Integer[]}
def find_even_numbers(digits)
    digits.permutation(3).filter{|ar| ar[0] != 0 and ar.last.even?}.sort.uniq.map{|ar| ar.join("").to_i()}
end
