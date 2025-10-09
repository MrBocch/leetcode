# @param {String} column_title
# @return {Integer}
def title_to_number(column_title)
  colValues = {} 
  ("A".."Z").each_with_index { |value, i| colValues[value] = i+1}

  column_number = 0
  column_title.split("") .reverse .each_with_index {|char, i|
    column_number += colValues[char] * (26**i)
  } 
  
  return column_number
end