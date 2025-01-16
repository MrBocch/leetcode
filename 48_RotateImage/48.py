# this is not solved but, im really struggeling with easy stuff
# which means i must be tired
# 11:43pm, got home back from work at 7..need to sleep tobeready for tmmrow.... being an adult sucks
def rotate(m):
  n = len(m[0])
  if n == 1:
    return m
  if n == 2:
    m[1][0], m[0][0] = m[0][0], m[1][0]
    m[1][1], m[1][0] = m[1][0], m[1][1]
    m[0][1], m[1][1] = m[1][1], m[0][1]
    return m
  else:
    swap_bot_left = True
    swap_right_bot= False
    swap_top_right = False
    bot_i = n -1
    bot_j = 0
    left_i = 0
    left_j = 0
    while swap_bot_left:
      # swap bot with left
      m[bot_i][bot_j], m[left_i][left_j] = m[left_i][left_j],m[bot_i][bot_j]
      bot_j += 1
      left_i += 1
      if bot_j == n:
          swap_bot_left = False
          swap_right_bot = True

    print(m)
    right_i = n - 1
    right_j = n - 1
    bot_i = n-1
    bot_j = 0
    while swap_right_bot:
      m[right_i][right_j], m[bot_i][bot_j] = m[bot_i][bot_j], m[right_i][right_j]
      bot_j += 1
      right_i -= 1
      if bot_j == n:
        swap_right_bot = False
        swap_top_right = True
    print(m)

rotate([[1,2,3],[4,5,6],[7,8,9]])
