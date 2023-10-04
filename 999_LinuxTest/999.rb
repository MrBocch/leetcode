
def getTime 
  print "H: "
  h = gets.chomp!.to_i
  print "M: "
  m = gets.chomp!.to_i
  print "S: "
  s = gets.chomp!.to_i
  
  return h, m, s
  # return s + (m*60) + (h*3600)
end

def displayTime h, m, s
  15.times {puts ""}
  puts "#{h}:#{m}:#{s}".center(25)
end

def pomloop time, h, m, s
  1.upto(time) { |i| 
    system("cls") or system("clear") 

    displayTime h, m, s