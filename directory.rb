require 'csv'
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
  CSV.open(filename, "wb") do |csv|
    csv << @students.first.keys
    @students.each do |hash|
      csv << hash.values
    end
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename, headers: true) do |student|
    name, cohort = student["name"], student["cohort"]
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Could not load #{filename} as it doesn't exist"
    exit
  end
end

# def print_program
#   puts __FILE__
# end
# print_program

try_load_students
interactive_menu

