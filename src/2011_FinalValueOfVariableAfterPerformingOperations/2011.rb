# @param {String[]} operations
# @return {Integer}
def final_value_after_operations(operations)
  operations.map{|op| if ["--X", "X--"].include?(op) then -1 else 1 end}.sum
end