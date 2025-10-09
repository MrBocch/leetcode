# @param {Character[]} chars
# @return {Integer}
def compress(chars)
    c = group(chars)
    c = c.map{|l| (normalize(l)).split("") }.flatten
    # chars = c; does not work because its a reference? 
    (0..c.size).each do |i|
        chars[i] = c[i] # c cant be longer than chars so its ok, even if so, ruby just pushes the value in
    end
    return c.size
end

def group(chars, carry=[])
    if chars.empty? then return carry end 
    
    head = chars.first
    if carry.empty?
        carry.push( [head] )
        return group(chars.drop(1), carry)
    end

    if head == carry.last[0] 
        carry.last.push( head )
        return group(chars.drop(1), carry)
    else 
        carry.push([head])
        group(chars.drop(1), carry)
    end
end

def normalize(l)
    slen = l.size
    if slen == 1
        return l[0]
    end

    return "#{l[0]}#{slen}"
end 