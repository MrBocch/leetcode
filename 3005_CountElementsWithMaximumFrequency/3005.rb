# @param {Integer[]} nums
# @return {Integer}
def max_frequency_elements(nums)
    freq = nums.tally.sort_by{|k,v| v}
    maxf = freq.last[1]
    return freq.filter_map{|arr| arr[1] if arr[1] == maxf}.sum
end