def print_header
  puts  "The students of Villains Academy"
  puts "-------------" 
end

def input_students
  # all students info will be stored in an Array
  students = []

  # collection of individual student info 
  puts "enter 'continue' to start student entry: "
  entry = gets.chomp.downcase
  while entry == "continue" do
    puts "Please enter name of the student"
    # added default value if nil is entered. 
    name = gets.chomp.to_sym
      if name == ""
        name = "no entry".upcase
      end

    # added input options for cohort entry
    cohort_input_options = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "decemeber"]
    
    # created loop to stop user entering invalid input or typo's.
    cohort = "invalid"
    until cohort != "invalid" do
      puts "Which cohort is #{name}'s' in?: "
      cohort = gets.chomp.downcase
        if cohort == ""
          cohort = "no entry".upcase
        elsif cohort_input_options.include?(cohort)
          cohort
        else 
          cohort = "invalid"
        end
    end

    puts "enter #{name}'s hobbies use comma ','  to seperate: "
    hobbies = gets.chomp.split(",")

    puts "enter #{name}'s country of birth: "
    birth_country = gets.chomp.to_sym

    puts "enter #{name}'s height in cm: "
    height = gets.chomp.to_i

    # storing student details
    students << {
      name: name,
      cohort: cohort,
      hobbies: hobbies,
      country_of_birth: birth_country,
      height: height
    }
    # option to add another student or end entry
    puts "enter 'continue' for next student or 'stop' to finish"
    entry = gets.chomp.downcase
  end
  # returns final entered students info
  students
end

def print_by_cohort(students)

  students_cohort = students 
  
  # Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. 
  # To do this, you'll need to get a list of all existing cohorts 
  # (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.

  cohort_months = students_cohort.map { |student| student[:cohort] }
  
  cohort_months.uniq.each do |month|
    puts "#{month} cohort".upcase
      students_cohort.each do |profile|
        if profile[:cohort] == month
          puts "#{profile[:name]}"
        end 
      end 
    end 
end
  
def print(students)
  # prints all student details
  students.each_with_index do |student, i|
    puts " #{i+1}. #{student[:name]}".center(20)
    puts "#{student[:cohort]} cohort".center(20)
    puts "hobbies: #{student[:hobbies]}".center(20)
    puts "country of birth: #{student[:country_of_birth]}".center(20)
    puts "height: #{student[:height]}".center(20)
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

students_cohort = [
  { name: "Dr. Hannibal Lecter", cohort: :january},
  { name: "Darth Vader", cohort: :january},
  { name: "Nurse Ratched", cohort: :february},
  { name: "Michael Corleone", cohort: :february},
  { name: "Alex DeLarge", cohort: :march},
  { name: "The Wicked Witch of the West", cohort: :march},
  { name: "Terminator", cohort: :may},
  { name: "Freddy Krueger", cohort: :may},
  { name: "The Joker", cohort: :june},
  { name: "Joffrey Baratheon", cohort: :july},
  { name: "Norman Bates", cohort: :july},
  ]

#nothing happens until we call the methods
students = students_cohort
print_by_cohort(students)
print_footer(students)
