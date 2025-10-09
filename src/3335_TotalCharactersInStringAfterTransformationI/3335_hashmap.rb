# @param {String} s
# @param {Integer} t
# @return {Integer}
def length_after_transformations(s, t)
    transformed = s.split("").tally()
    1.upto(t) do
      transformed = hash_transform(transformed)
    end
    
    return transformed.sum{|k, v| v} % ((10**9 ) +7)
end

def hash_transform(h)
    carry = Hash.new(0)
    h.each_pair do |k, v|
        if k == "z"
            carry["a"] += v
            carry["b"] += v
        else
            carry[k.next] += v
        end
    end

    return carry
end