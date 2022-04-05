@students = []

def print_menu
  puts "1. Input the students",
  "2. Show the students",
  "3. Save the list to students.csv",
  "4. Load the list from students.csv",
  "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process_options(STDIN.gets.chomp)
  end
end

def process_options(selection)
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
    add_student(name, :november)
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

def save_students
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved #{@students.count} students to csv"
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
  puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Could not load #{filename} as it doesn't exist"
    exit
  end
end

try_load_students
interactive_menu

