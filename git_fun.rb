#!/cygdrive/c/tools/ruby25/bin/ruby

require 'optparse'
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby_fun.rb [options]"

# no argument required
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end

# argument required
  opts.on("-pPATH", "--path", "Path to Repo",:reqiured ) do |path|
    options[:path] = path
  end

end.parse!
fail "Path not provided" unless options[:path]
my_path = options[:path]
fail "Given path does not exist: " + my_path unless Dir.exist?(my_path)
Dir.chdir my_path
my_string = `git branch -a`
puts "string is: " + my_string
lines = my_string.chomp.split(/\n/)
lines.each { |x| puts "line is #{x}" }


