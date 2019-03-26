@students = []


def interactive_menu
  loop do
    print print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Search student by first letter of name"
  puts "4. Save students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    name_by_letter
  when "4"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

# print out methods

def print_header
  puts "The Students of Villain Academy"
  puts "-------------------------------"
end

def print_students_list
  @students.each.with_index(1) do |student, index| puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" end
end

def print_footer
  if @students.length < 0
  puts "We don not have any students"
  elsif @students.length == 1
  puts "Overall we have #{@students.count} great student"
  else
  puts "Overall we have #{@students.count} great students"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

# input student method

def input_students
  puts "Please enter a student"
  puts "To return the current directory, hit enter twice"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.length == 1
    puts "now we have #{@students.count} student"
    else
    puts "now we have #{@students.count} students"
    end
    name = gets.chomp
  end
end

# saving students to CSV method

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end 

# name by first letter method

def name_by_letter
  puts "Please enter a letter to search (first name)"
  puts "To return the current directory, hit enter twice"
  letter = gets.chomp.upcase
    @students.each do |student|
      if letter == student[:name][0]
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
end


interactive_menu
