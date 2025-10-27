# @param {String[]} bank
# @return {Integer}
def number_of_beams(bank)
  count = 0
  cur = nil
  bank.map{|f| f.count("1")}.each do |lasers|
    if cur == nil then cur = lasers; next end 
    if lasers == 0 then next end 
    count += cur * lasers
    cur = lasers
  end

  count  
end