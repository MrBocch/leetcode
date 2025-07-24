# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  if nums.empty? then return 0 end 
  su_nums = nums.uniq.sort 

  prev_n = su_nums[0]
  curr_seq = 1
  long_seq = 0
  nums.uniq.sort[1..].each do |n|
    if prev_n + 1 == n then 
      curr_seq += 1
    else 
      long_seq = [long_seq, curr_seq].max
      curr_seq = 1
    end
    prev_n = n
  end
  
  return [long_seq, curr_seq].max
end