# @param {String[]} words
# @return {String[]}
class String
  def sort
    chars.sort.join
  end
end

def remove_anagrams(words)
  ans = [words.first]
  prev = words.first.sort
  words.each do |w|
    if w.sort != prev
      ans << w
      prev = w.sort
    end 

  end
  
  return ans 
end
