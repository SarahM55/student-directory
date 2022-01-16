require "csv"

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from file"
  puts "5. Exit" 
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    action_successful
  when "2"
    show_students
    action_successful
  when "3"
    save_students
    action_successful
  when "4"
    load_students
    action_successful
  when "5"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def action_successful
  puts "Action was successfully completed"
  puts "-------------"
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_number_of_students
  if @students.count != 1
    puts "Now we have #{@students.count} great students"
  else
    puts "Now we have #{@students.count} great student"
  end
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
  puts "#{name} has been added!"
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = $stdin.gets.chomp
  until name.empty?
    add_student(name)
    print_number_of_students
    # get next name
    puts "Enter the next name or hit return twice to finish"
    name = $stdin.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def select_file
  puts "Enter the filename you want to use"
  file = $stdin.gets.chomp
end

def save_students
  # open the file for writing
  file = select_file
  CSV.open(file, 'w') do |doc|
    @students.each do |student|
      doc << [student[:name], student[:cohort]]
    end
  end
  puts "The students have been saved to #{file}"
end

def load_students
  load_file = select_file
  students_from_file(load_file)
end

def students_from_file(filename = "students.csv")
  @students = []
  CSV.parse(File.read(filename)) do |row|
    name, cohort = row
    add_student(name, cohort)
  end
  puts "#{@students.count} students were loaded from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    students_from_file(filename)
  else # if it doesn't exist
    students_from_file
    exit # quit the program
  end
end

def print_footer
  print_number_of_students
end

try_load_students
interactive_menu