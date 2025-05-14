# @param {String} s
# @param {Integer} t
# @return {Integer}
def length_after_transformations(s, t)
    transformed = s 
    1.upto(t) do 
        transformed = transformed.split("").map{|c| c_map(c) }.join("")
    end

    return transformed.size() % ((10**9) + 7)
end

def c_map(c)
    return ( c == "z" ? "ab" : c.next )
end