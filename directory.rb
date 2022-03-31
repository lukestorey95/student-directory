# Method to get students from user
# def input_students
#   puts "Please enter the names of the students, and what cohort they belong to sepearted by a colon e.g. Student Name: cohort"
#   puts "To finish, just hit enter twice"

#   students = []

#   input = gets.chomp

#   while !input.empty? do
#     name = input.split(":")[0].strip
#     cohort = input.split(":")[1].strip == nil ? :april : input.split(":")[1].strip.downcase.to_sym

#     students << {name: name, cohort: cohort}
#     puts "Now we have #{students.count} students"
#     input = gets.chomp
#   end

#   students
# end

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :april},
  {name: "Michael Corleone", cohort: :april},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :february},
  {name: "The Joker", cohort: :february},
  {name: "Joffrey Baratheon", cohort: :february},
  {name: "Norman Bates", cohort: :november}
]

# define methods to print student information
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def group_cohorts(students)
  # group students by their cohort
  students_grouped_by_cohort = students.group_by { |student| student[:cohort] }
  # get array of cohort months
  cohort_months = students_grouped_by_cohort.keys
  # get array of cohort names
  cohort_student_names = students_grouped_by_cohort.map {|cohort, students| students.map { |student| student[:name] } }
  # return hash of cohort names per month
  Hash[cohort_months.zip(cohort_student_names)]
end

def print(students)
  group_cohorts(students).each do |cohort, names|
    puts "#{cohort.upcase}"
    names.each do |name| puts "#{name}" end
    puts "-------------"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# call methods
# students = input_students
print_header
print(students)
print_footer(students)
