# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
  ranks = ranks(arr)

  arr.map{|n| ranks[n]}
end

def ranks(arr)
  hash = Hash.new
  arr.uniq.sort.each_with_index do |n, i|
    hash[n] = i + 1 
  end

  hash
end