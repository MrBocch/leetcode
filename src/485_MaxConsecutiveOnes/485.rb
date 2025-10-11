# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  def groups(nums, carry=[[]])
    return carry if nums == [] 
    head = nums.pop
    if head == 1 
        carry[-1] << head
    else 
        carry << []
    end
    return groups(nums, carry)
  end

  return groups(nums).max_by {|g| g.size }.size 
end
