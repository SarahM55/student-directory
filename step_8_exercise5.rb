def print_header
    puts 'The students of Villains Academy'
    puts '-------------'
  end
  
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) Height: #{student[:height].join(',')}"
  end
end
  
def print_footer(names)
  # print the number of students
  puts "Overall, we have #{names.count} great students"
end
  
def input_height(name)
  # Enter height
  puts "Enter the height for #{name} (in cm)"
  puts 'To finish, just hit return twice'
  heights = []
  height = gets.chomp
  until height.empty?
    heights << height
    height = gets.chomp
  end
  heights
end
  
def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
    students = []
    name = gets.chomp
    # while the name is not empty, repeat this code
    until name.empty?
      height = input_height(name)
      # add the student hash to the array
      students << { name: name, cohort: :november, height: height }
      puts "Now we have #{students.count} student(s)"
      # get another name from the user
      name = gets.chomp
    end
    students
end

  students = input_students
  print_header
  print(students)
  print_footer(students)