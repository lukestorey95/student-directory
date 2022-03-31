# Method to get students from user
def input_students
  puts "Please enter the names of the students, and what cohort they belong to sepearted by a colon e.g. Full Name: cohort"
  puts "To finish, just hit enter twice"

  students = []

  input = gets.chomp

  while !input.empty? do
    name = input.split(":")[0].strip
    cohort = input.split(":")[1].strip == nil ? :unknown : input.split(":")[1].strip.downcase.to_sym

    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    input = gets.chomp
  end

  students
end

# define methods to print student information
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# call methods
students = input_students
print_header
print(students)
print_footer(students)
