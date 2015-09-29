OUTDIR = './output'
TMPDIR = './input-tmp'

task :default => :build

task :build do
  FileUtils.mkdir_p TMPDIR
  system "./build-tutorial src/basics.md > #{TMPDIR}/basics.md"
  system "generate-md --layout rubybook-bootstrap --input #{TMPDIR}  --output #{OUTDIR}"

  FileUtils.rm_r TMPDIR
end

task :clean do
  FileUtils.rm_rf([OUTDIR, TMPDIR])
end
