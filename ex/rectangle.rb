rows = ARGV[0].to_i
columns = ARGV[1].to_i

rows.times do |r|
  columns.times do |c|

    cond = c == 0 || c == columns - 1 || r == 0 || r == rows - 1
    char = if cond
             '#'
           else
             '.'
           end
    print char
  end
  puts
end


