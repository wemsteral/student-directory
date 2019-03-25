

def print_header
puts "The Students of Villain Academy"
puts "-------------------------------"
end

def print_students(students)
students.each do |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" end
end

def print_footer(students)
puts "Overall we have #{students.count} great students"
end

def input_students
  puts "Please enter a student"
  puts "To return the current directory, hit enter twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "no we have #{students.count} students"
    name = gets.chomp
  end
    students
end

students = input_students
print_header
print_students(students)
print_footer(students)
