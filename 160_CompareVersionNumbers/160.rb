# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
    v1 = version1.split(".")
    v2 = version2.split(".")
    while v1.length < v2.length do v1.push 0 end
    while v2.length < v1.length do v2.push 0 end
    
    (0...v1.length).each do |i|
        n1 = v1[i].to_i
        n2 = v2[i].to_i
        return -1 if n1 < n2
        return  1 if n1 > n2  
    end
    return 0
end