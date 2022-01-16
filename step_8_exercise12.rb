def print_header
    puts 'The students of Villains Academy'
    puts '-------------'
end
  
def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
  
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    # using strip (replacing chomp) to remove leading + trailing whitespace
    name = gets.strip
    # get the cohort value
    until name.empty? do
      puts "Enter the cohort month (leave blank for default month)"
      cohort = gets.strip
      cohort = "november" if cohort.empty?

      # let user change details
      puts "Name: #{name}, Cohort: #{cohort}"
      puts "Do you want to change these details? Type 'yes' or 'no'"
      response = gets.strip
      if response == "no"
        students << { name: name, cohort: cohort.to_sym }
        if students.count != 1
        puts "Now we have #{students.count} students"
      else
        puts "Now we have #{students.count} student"
      end
    else
      puts 'Student data discarded, please re-enter'
    end

      # get another name from the user
      puts "Enter the next student"
      name = gets.strip
    end
    # return the array of students
  students
end

def grouped_by_cohort(students)
  grouped_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    if grouped_by_cohort[cohort] == nil
      grouped_by_cohort[cohort] = []
    end
      grouped_by_cohort[cohort].push(student[:name])
    end
  puts grouped_by_cohort
end

def print_footer(names)
  # print the number of students
  if names.count != 1
    puts "Overall, we have #{names.count} great students"
  else
    puts "Overall, we have #{names.count} great student"
  end
end

students = input_students
print_header
grouped_by_cohort(students)
print_footer(students)