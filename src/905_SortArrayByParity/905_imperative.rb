# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity(nums)
  sorted = nums
  (1..sorted.length-1).each do |i|
    j = i
    while(true)
      if sorted[j].odd? then break end
      if sorted[j-1].even? then break end

      temp = sorted[j-1]
      sorted[j-1] = sorted[j]
      sorted[j] = temp
      if j-1 != 0 
        j -= 1
      else 
        break
      end
    end
  end

  return sorted
end