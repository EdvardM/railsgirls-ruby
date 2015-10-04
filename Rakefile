OUTDIR = './output'
TMPDIR = './input-tmp'
OUTFILE = File.join(TMPDIR, 'book.md')
task :default => :build


task :build do
  FileUtils.mkdir_p TMPDIR
  system "./build-tutorial src/basics.md > #{OUTFILE}"
  system "./build-tutorial src/intermediate.md >> #{OUTFILE}"
  system "generate-md --layout rubybook-bootstrap --input #{TMPDIR}  --output #{OUTDIR}"

  FileUtils.rm_r TMPDIR
end

task :clean do
  FileUtils.rm_rf([OUTDIR, TMPDIR])
end
