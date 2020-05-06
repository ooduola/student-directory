def print_header
  puts  "The students of Villains Academy"
  puts "-------------" 
end

def input_students
  # all inputed students details will be stored in an Array
  students = []

  # start with collecting student name
  puts "Please enter name of the student"
  name = gets.chomp

  while !name.empty? do
    # collecting individual student details 
    puts "enter #{name}'s hobbies use comma ','  to seperate: "
    hobbies = gets.chomp.split(",")

    puts "enter #{name}'s country of birth: "
    birth_country = gets.chomp

    puts "enter #{name}'s height in cm: "
    height = gets.chomp.to_i

    # storing student details
    students << {
      name: name,
      cohort: :november,
      hobbies: hobbies,
      country_of_birth: birth_country,
      height: height
    }
    # option to add another student or end entry
    puts "enter a new student name or press enter to stop"
    name = gets.chomp
  end
  # returns final students details inputed
  students
end

def print(students)
  # prints all student details
  students.each_with_index do |student, i|
    puts " #{i+1}. #{student[:name]}"
    puts "#{student[:cohort]} cohort"
    puts "hobbies: #{student[:hobbies]}"
    puts "country of birth: #{student[:country_of_birth]}"
    puts "height: #{student[:height]}"
    puts ""
  end 
end

def print_filter_name(students)
  # collect filter letter to filter name
  puts  "Which students names starting with a letter would you like to see?"
  first_letter = gets.chomp.upcase

  filtered = students.map do |student| 
    if student[:name][0].upcase == first_letter
      "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  # return filtered list and their details
  filtered.delete(nil)
  puts filtered 
  puts "Overall, we have #{filtered.count} students with the name starting #{first_letter}"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)