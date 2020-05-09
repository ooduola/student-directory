@students = [] # an empty array accessible to all methods

def input_students_process
  input_students_user_message
  # get the first student name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add student info hash to the array
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
  puts "3. Save students to a file"
  puts "4. Load students from file"
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
      exit # will cause the program to terminate
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

def save_students_old
  # ask user to select filename to input students info
  puts "Please enter filename you'd like to save student info to: "
  filename = STDIN.gets.chomp
  # open the file for writing
  file = File.open(filename, "w")
  # interate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(",")
  end
  file.close
  puts "Students were succesfully saved to #{filename}"
end

def save_students
  # ask user to select filename to input students info
  puts "Please enter filename you'd like to save student info to: "
  filename = STDIN.gets.chomp
  # open the file for writing
  File.open(filename, "w") do |file|
  # interate over the array of students and store in filename
    @students.each do |student|
      file.puts [student[:name], student[:cohort]].join(",")
    end
  end
  puts "Students were succesfully saved to #{filename}"
end

def load_students_default(filename = "students.csv")
  # interate over each line and store to name, cohort variables
  File.foreach(filename, "r") do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort = :november) 
  end
  puts "#{filename} was succesfully loaded"
end

def load_students(filename = "students.csv")
  puts "Which file would you like to upload students from?"
  filename = STDIN.gets.chomp
  if File.exists?(filename) # if it exists
    load_students_default
  else # if it doesn't exist
    puts "Sorry, #{filename} file doesn't exist"
    exit # quit the program
  end
end

def try_load_students_default
  filename = ARGV.first # first argument from the commman line
  (filename = "students.csv") if filename.nil? # default file if no argument given
  if File.exists?(filename) # if it exists
    load_students_default(filename)
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
