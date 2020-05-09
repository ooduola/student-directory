@students = [] # an empty array accessible to all methods

def input_students_process
  input_students_user_message
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    add_students(name, cohort = :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  puts "Students were succesfully added"
end 

def input_students_user_message
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  # 3. do what the user has asked
  case selection 
    when "1"
      input_students_process
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      puts "Program exit successful. See you next time"
      exit # this will cause the program to terminate
    else 
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts  "The students of Villains Academy"
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
  # open the file for writing
  file = File.open("students.csv", "w")
  # interate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(",")
    
  end
  file.close
  puts "Students were succesfully saved"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort = :november) 
  end
  file.close
  puts "#{filename} was succesfully loaded"
end

def try_load_students_default
  filename = ARGV.first # first argument from the commman line
  (filename = "students.csv") if filename.nil? # default file if no argument given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def add_students(name, cohort = :november)
  # add to student info to array
  @students << {name: name, cohort: cohort}
end

#nothing happens until we call the methods
try_load_students_default
interactive_menu
