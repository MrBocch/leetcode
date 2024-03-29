# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  freq = Hash.new(0)

  nums.each{ |n| 
    freq[n] += 1 
  }

  good = 0

  freq.each_value{ |n|
    good += (n * (n-1))/2
  }

  return good 
end