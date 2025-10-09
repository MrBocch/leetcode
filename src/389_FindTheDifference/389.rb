# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
  sfreq = s.split("").tally
  tfreq = t.split("").tally

  return (tfreq.to_a - sfreq.to_a)[0][0]
end