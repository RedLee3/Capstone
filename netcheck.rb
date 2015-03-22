#!/usr/bin/ruby

command = `ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

i = 1

while command == ""
  command = `ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
  puts "no ip on try ##{i}"
  i += 1
  sleep 2
end

puts command
