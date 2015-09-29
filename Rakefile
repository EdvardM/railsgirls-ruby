OUTDIR = './output'

task :build do
  FileUtils.mkdir_p 'input'
  system './build-tutorial src/basics.md > input/basics.md'
  system "generate-md --layout rubybook-bootstrap --input ./input  --output #{OUTDIR}"
end

task :clean do
  FileUtils.rm_r OUTDIR
end
