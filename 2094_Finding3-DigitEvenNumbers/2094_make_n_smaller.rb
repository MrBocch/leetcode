# @param {Integer[]} digits
# @return {Integer[]}
require 'set'

def find_even_numbers(digits)
    n_digits = normalize(digits)
    collect = Set.new()
    
    n_digits.sort.permutation(3) do |arr|
        if arr[0] == 0 then next end
        if arr[2] % 2 != 0 then next end

        collect.add(arr.join("").to_i)
    end
    collect.to_a
end

def normalize(digits)
    n_digits = []
     digits.tally.each do |k, v|
        if k == 0
            if v == 1 
                n_digits << 0
            else 
                n_digits << 0 << 0
            end
            next
        end
        if v == 1
            n_digits << k
        elsif v == 2
            n_digits << k << k
        else 
            n_digits << k << k << k
        end
    end

    return n_digits
end