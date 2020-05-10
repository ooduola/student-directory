require 'csv'
@students = []

def input_students_process
  input_students_user_message 
  name = STDIN.gets.chomp # get the first student name
  while !name.empty? do 
    add_students(name, cohort = :november) # add student info: hash to array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another input from user
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
  case selection # 3. do what the user has asked
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

def save_students
  puts "Please enter filename you'd like to save student info to: "
  filename = STDIN.gets.chomp
 CSV.open(filename, "wb") do |csv| # open the file for writing
    @students.each do |student| # interate over the array of students and store in filename
    csv << [student[:name], student[:cohort]]
    end
  end
  puts "Students were succesfully saved to #{filename}"
end

def load_students_default(filename = "students.csv")
  CSV.foreach(filename, "r") do |line| # interate over each line and store to name, cohort variables
    name, cohort = line
    add_students(name, cohort = :november) 
  end
  puts "#{filename} was succesfully loaded"
end

def load_students(filename = "students.csv")
  puts "Which file would you like to upload students from?"
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    load_students_default
  else 
    puts "Sorry, #{filename} file doesn't exist"
    exit 
  end
end

def try_load_students_default
  filename = ARGV.first # first argument from the commman line
  (filename = "students.csv") if filename.nil? # default file if no argument given
  if File.exists?(filename) 
    load_students_default(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist"
    exit 
  end
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

try_load_students_default
interactive_menu
