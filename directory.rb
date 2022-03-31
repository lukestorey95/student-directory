# Method to get students from user
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"

  students = []

  name = gets[0...-1]

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets[0...-1]
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
