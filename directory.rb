# array of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, birth_country: :Germany},
  {name: "Darth Vader", cohort: :november, birth_country: :Space},
  {name: "Nurse Ratched", cohort: :november, birth_country: :France},
  {name: "Michael Corleone", cohort: :november, birth_country: :France},
  {name: "Alex DeLarge", cohort: :november, birth_country: :Germany},
  {name: "The Wicked Witch of the West", cohort: :november, birth_country: :USA},
  {name: "Terminator", cohort: :november, birth_country: :Germany},
  {name: "Freddy Krueger", cohort: :november, birth_country: :USA},
  {name: "The Joker", cohort: :november, birth_country: :USA},
  {name: "Joffrey Baratheon", cohort: :november, birth_country: :Westeros},
  {name: "Norman Bates", cohort: :november, birth_country: :USA}
]

# define methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) - born in #{student[:birth_country]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# call methods
print_header
print(students)
print_footer(students)
