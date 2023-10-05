# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  nfreq = Hash.new(0)
  nums.each {|n| nfreq[n] += 1}
  constant = nums.length/3
  return nums.filter{|n| nfreq[n] > constant}.uniq 
end