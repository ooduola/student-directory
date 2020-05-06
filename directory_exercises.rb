# let's put all students into an array
def print_header
  puts  "The students of Villains Academy"
  puts "-------------" 
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  students
end 

def filter_name
  puts "Enter number to print students names with characters less than given input: "
  name = gets.chomp.to_i
end

# collect the students names with whose name begins with first letter.
def print(students, name_size)
  filtered = students.map do |student| 
    if student[:name].size < name_size
      "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  filtered.delete(nil)
  puts filtered 
  puts "Overall, we have #{filtered.count} students with names less than #{name_size} characters long"
end

students = input_students
name_size = filter_name
print_header
print(students, name_size)
