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

def filtered_students
  puts  "which students whose name begins with a specific letter would you like to see?"
  letter = gets.chomp.upcase
end
# collect the students names with whose name begins with first letter.
def print(students, first_letter)
  filtered = students.map do |student| 
    if student[:name][0] == first_letter
      "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  filtered.delete(nil)
  puts filtered 
  puts "Overall, we have #{filtered.count} students with name starting #{first_letter}"
end

students = input_students
print_header
first_letter = filtered_students
print(students, first_letter)
