# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
  content = 0
  s = s.sort
  g = g.sort

  s.each_index{|i| 
    g.each_index {|j| 
      if s[i] >= g[j] 
        content += 1
        g.delete_at(j)
        break
      else
        break
      end 
    }
  }

  return content
end