require 'nmap/xml'
 
Nmap::XML.new(open ARGV[0]) do |xml|
  xml.each_host do |host|
    puts
    puts "#{host.ip}, #{host.mac}, #{host.hostnames[0]}"
    puts "#{host.os.matches[0]}"
    puts "#{host.os.matches[1]}"
    puts "#{host.os.matches[2]}"
    puts "#{host.os.matches[3]}"
 
    host.each_port do |port|
      puts "  #{port.number}/#{port.protocol}\t#{port.state}\t#{port.service}"
    end
  end
end
