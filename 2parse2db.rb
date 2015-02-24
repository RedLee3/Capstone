require 'nmap/xml'
require 'sqlite3'
 
db = SQLite3::Database.new "test_parsed.db"

Nmap::XML.new(open ARGV[0]) do |xml|
  xml.each_host do |host|
    ip = host.ip
    mac = host.mac
    name = host.hostnames[0]
    #host.os.matches[0]
    #host.os.matches[1]
    #host.os.matches[2]
    #host.os.matches[3]

#Inserting into db
    db.execute("INSERT into test_parsed.db (ip, mac, name) VALUES (?, ?, ?)", [ip, mac, name])
  end
end
