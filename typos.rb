def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
 end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  # added if statement to only print once student name is added.
  if students.count >= 1
    students.each do |student|
      puts "#{student[:name]} #{student[:cohort]} cohort"
    end
  else
    puts "We have zero students"
  end
end

def print_footer(students)
  # added if statement to only print footer if student name has been added.
  if students.count >= 1
    puts "Overall, we have #{students.count} great students"
  end
end


students = input_students
print_header
print(students)
print_footer(students)
