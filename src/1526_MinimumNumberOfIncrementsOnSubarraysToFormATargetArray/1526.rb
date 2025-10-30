# @param {Integer[]} target
# @return {Integer}
def min_number_operations(target)
  acum = 0
  prev = 0
  target.each do |n|
    if n > prev then
      acum += n - prev 
    end 
    prev = n
  end

  acum
end 