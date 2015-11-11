# extra: write a program which prints several names, and greets only the
# name you give in command line in a special way. Eg
#
# ruby 02.rb Ed
# 
# Alice
# Howdy, Ed!
# Bob


some_names = ['Alice', 'Ed', 'Bob']
given = ARGV[0]

some_names.each do |name|
  if given == name
    puts "Howdy, " + name
  else
    puts name
  end
end
