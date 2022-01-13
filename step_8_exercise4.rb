# defining initial to be used later
class String
    def initial
      self[0,1]
    end
  end 
  
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
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print(students)
    counter = 0
    while students.count == counter
      (students[counter][:name]).to_s
      counter += 1
    end
  end
  
  def print_specific_letter(students)
    puts "Enter the first letter of the student's name"
    letter = gets.chomp.upcase
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].initial.upcase == letter
    end
  end
  
  def print_name_shorter(students)
    puts "Enter the maximum length of the student's name"
    length = gets.chomp.to_i
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length <= length
    end
  end 
  
  def print_footer(students)
    puts "Overall, we have #{students.count} great students"
  end
  
  students = input_students
  #nothing happens until we call the methods
  print_header
  print(students)
  print_footer(students)
  print_specific_letter(students)
  print_name_shorter(students)