height = ARGV[0].to_i

height.times do |r|
  (r+1).times do |c|
    char = '.'
    if c == 0 ||  c == r || r == height - 1 || r == 0
      char = '#'
    end
    print char
  end
  puts
end
