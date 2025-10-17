#!/usr/bin/env ruby

require 'clipboard'

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
    submit_problem(n, name)
  when false
    name = get_problem_name n
    create_folder(n, name)
    create_notes(n, name)
    submit_problem(n, name)
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

def get_folder_path(num, name)
  "#{__dir__}/src/#{num}_#{name}"
end

def get_problem_name(num)
  puts 'Enter name in (PascalCase)'
  print "#{num}_"
  readline.chomp.strip
end

def create_folder(num, name)
  path = "#{__dir__}/src"
  folder = "#{num}_#{name}"
  puts "Creating folder #{folder}"
  Dir.mkdir("#{path}/#{folder}")
end

def date
  t = Time.now
  year   = t.year
  month = t.month < 10 ? "0#{t.month}" : t.month
  day   = t.day   < 10 ? "0#{t.day}" : t.day
  "#{year}-#{month}-#{day}"
end

def create_notes(num, name)
  folder_path = get_folder_path(num, name)
  File.open("#{folder_path}/notes.txt", 'w') do |f|
    f.write("#{date}\n\n")
  end
end

def submit_problem(num, name)
  folder_path = get_folder_path(num, name)
  subfiles = Dir.children(folder_path).filter { |name| name != 'notes.txt' }
  unless subfiles.empty?
    puts "Files in #{folder_path}\n"
    subfiles.each { |fname| puts "-> #{fname}" }
  end

  puts 'Do you want a description (if no leave empty)'
  print "#{num}_"
  description = readline.chomp.strip

  puts 'Enter file extention of language'
  if description.empty? then print "#{num}." else print "#{num}_#{description}." end
  ext = readline.chomp.strip

  full_file_name = if description.empty? then "#{num}.#{ext}" else "#{num}_#{description}.#{ext}" end
  puts "\nGoing to create #{full_file_name}"

  write_submission(folder_path, full_file_name)
end

def write_submission(folder_path, file_name)
  # no need for preprocising the content?
  contents = Clipboard.paste
  File.open("#{folder_path}/#{file_name}", 'w') do |f|
    f.write(contents)
  end
end

main
