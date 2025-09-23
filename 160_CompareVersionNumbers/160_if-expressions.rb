# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
    v1 = version1.split(".")
    v2 = version2.split(".")
    len = [v1.size, v2.size].max 
    (0...len).each do |i|
        n1 = if i < v1.size then v1[i].to_i else 0 end
        n2 = if i < v2.size then v2[i].to_i else 0 end 
        return -1 if n1 < n2
        return  1 if n1 > n2  
    end
    return 0
end