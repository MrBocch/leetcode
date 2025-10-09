# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  sfreq = Hash.new(0)
  tfreq = Hash.new(0)

  s.each_char do |c| 
    sfreq[c] += 1
  end

  t.each_char do |c| 
    tfreq[c] += 1
  end

  sfreq.each_key do |key|
    if sfreq[key] != tfreq[key] then return false end
  end

  tfreq.each_key do |key|
    if tfreq[key] != sfreq[key] then return false end
  end

  return true
end