task :greet do
  puts "hello"
end
task :ask => :greet do
  puts 'how are you'
end
task :pick_winner => :environment do
  student = Student.first
  puts "Winner #{student.name}"
end