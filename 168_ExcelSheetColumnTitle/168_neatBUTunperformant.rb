# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  # this is absolutely terrible slow
  # but its so neat that ruby lets you do this
  # too slow, timelimit exceeded
  # its O(???) time?

  columnTitle = 'a'
  i = 1
  
  while not i == column_number
    columnTitle.succ!
    i += 1
  end

  return columnTitle.upcase
end