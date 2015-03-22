#!/usr/bin/ruby

#Command and stuff to get the ip address from ifconfig
command = `ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

i = 1

while command == ""
  command = `ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
  puts "no ip on try ##{i}"#For counting failed attempts, could be removed. 
  i += 1
  sleep 2
end

ip = command
mac = `ifconfig eth0 | grep 'inet addr:' | cut -d: -f4` #Command to get MAC address

#Putting variables. Can be pointed elsewhere as needed.
puts ip.chomp
puts mac.chomp
