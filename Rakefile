OUTDIR = './output'
TMPDIR = './input-tmp'
OUTFILE = File.join(TMPDIR, 'book.md')
task :default => :build

def run(cmd)
  rv = system(cmd)
  fail "failed to run #{cmd}" unless rv
end


desc 'build the book'
task :build do
  FileUtils.mkdir_p TMPDIR
  run "./build-tutorial src/basics.md > #{OUTFILE}"
  run "./build-tutorial src/intermediate.md >> #{OUTFILE}"
  run "generate-md --layout rubybook-bootstrap --input #{TMPDIR}  --output #{OUTDIR}"
  puts "book is at #{OUTDIR}"

  FileUtils.rm_r TMPDIR
end

task :clean do
  FileUtils.rm_rf([OUTDIR, TMPDIR])
end
