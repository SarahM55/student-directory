def print_header
    puts 'The students of Villains Academy'
    puts '-------------'
  end
  
def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
  
def print_footer(names)
  # print the number of students
  puts "Overall, we have #{names.count} great student(s)"
end
  
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # get the cohort value
    until name.empty? do
      puts "Enter the cohort month (leave blank for default month)"
      cohort = gets.chomp
      cohort = "November" if cohort.empty?

      # let user change details
      puts "Name: #{name}, Cohort: #{cohort}"
      puts "Do you want to change these details? Type 'yes' or 'no'"
      response = gets.chomp
      if response == "no"
        students << { name: name, cohort: cohort.to_sym }
        puts "Now we have #{students.count} student(s)"
      else
        puts "Data deleted"
      end

      # get another name from the user
      puts "Enter the next student or hit return twice to exit"
      name = gets.chomp
    end
    # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)