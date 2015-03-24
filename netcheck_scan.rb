#!/usr/bin/ruby

require 'ipaddr'

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

cidr = IPAddr.new(mac).to_i.to_s(2).count("1")

#Doing a sc
#scan = `msfcli auxiliary/scanner/portscan/tcp rhosts=127.0.0.1 E'
scan = `msfconsole -x "db_scan #{ip}/#{cidr} -O"`
