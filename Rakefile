OUTDIR = './output'
TMPDIR = './input-tmp'
OUTFILE = File.join(TMPDIR, 'book-%s.md')
LANGS = %w(en fi)
PARTS = %w(basics.md intermediate.md)
task :default => :build

def run(cmd)
  rv = system(cmd)
  fail "failed to run #{cmd}" unless rv
end

# TODO: this build file is highly crappy, fix
desc 'build the book'
task :build do
  FileUtils.mkdir_p TMPDIR
  LANGS.each do |lang|
    book = format(OUTFILE, lang)

    FileUtils.rm_f(book)
    PARTS.each do |part|
      part_src = File.join('src', lang, part)
      if File.exist?(part_src)
        run "./build-tutorial #{part_src} >> #{book}"
      else
        warn "Warning: #{part_src} does not exist"
      end
    end
  end

  run "generate-md --layout rubybook-bootstrap --input #{TMPDIR} --output #{OUTDIR} > #{TMPDIR}/out.log"
  puts "book is at #{OUTDIR}"

  FileUtils.rm_r TMPDIR
end

task :clean do
  FileUtils.rm_rf([OUTDIR, TMPDIR])
end
