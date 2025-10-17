def main
  banner = <<-EOF
  ====================
  ==    LEETCODE    ==
  ====================
  EOF

  help = <<-EOF
  (n) New solution
  (q) Quit
  EOF

  loop do
    puts banner
    puts help

    print '> '
    choice = readline.chomp
    case choice
    when 'n'
      new_solution
    when 'q'
      exit
    else
      puts "What was that? '#{choice}'"
    end
  end
end

def new_solution
  n = input_n.to_s
  path = "#{__dir__}/src"
  problems = Dir.children(path).map { |pn| pn.split('_') }
  case problems.map { |pn| pn[0] }.include? n
  when true
    name = problems.filter { |pn| pn[0].to_s == n }.first[1]
    puts "already solved: #{n}_#{name}"
  when false
    create_new_problem n
  end
end

def input_n
  begin
    puts 'input problem number'
    print '> '
    Integer(readline.chomp)
  rescue ArgumentError => e
    puts e
    input_n
  end
end

# for solved a new problem, inits folder
def create_new_problem(num)
  print 'Problem name in (PascalCase): '
  name = readline.chomp
  puts "Creating #{num}_#{name}"
end

def init_solution(folder_name)
  create_notes folder_name
  # now get solution from clipboard
end

def create_notes(folder_name)
  path  = "#{__dir__}/src"
  year  = Time.now.year
  month = Time.now.month < 10 ? "#{0}#{Time.now.month}" : Time.now.month
  day   = Time.now.day < 10 ? "#{0}#{Time.now.month}" : Time.now.month

  puts "Creating #{path}/#{folder_name}/notes.txt"
  Dir.mkdir "#{path}/#{folder_name}"
  File.open("#{path}/#{folder_name}/notes.txt", 'w') do |f|
    f.write("#{year}-#{month}-#{day}\n\n")
  end
end

# for solved a problem, but with a different
# language or different algorithm
def submit_solved_problem(num, name)
  puts 's'
end

main
