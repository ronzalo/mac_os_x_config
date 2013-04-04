#!/usr/bin/env ruby

ARGV.each do|a|
  puts "Argument: #{a}"
	args = a.split ':'
	args.each{|aa| puts "Subargs: #{aa}"}
	puts "emacsclient +#{args[1]} #{args[0]}"
	system("emacsclient +#{args[1]} #{args[0]}")
end
