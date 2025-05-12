# @param {Integer[]} digits
# @return {Integer[]}
require 'set'

def find_even_numbers(digits)
    collect = Set.new()
    digits.sort.permutation(3) do |arr|
        if arr[0] == 0 then next end
        if arr[2] % 2 != 0 then next end

        collect.add(arr.join("").to_i)
    end
    collect.to_a
end