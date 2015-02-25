require 'nmap/xml'
require 'sqlite3'
 
db = SQLite3::Database.new "test.db"

db.execute ("CREATE TABLE IF NOT EXISTS hosts_table( ip TEXT, mac TEXT, name TEXT )")

Nmap::XML.new(open ARGV[0]) do |xml|
  xml.each_host do |host|
    ip = host.ip
    mac = host.mac
    name = host.hostnames[0]
    #puts ip
    #puts mac
    #puts name
    #host.os.matches[0]
    #host.os.matches[1]
    #host.os.matches[2]
    #host.os.matches[3]

#Inserting into db
    db.execute("INSERT INTO hosts_table (ip, mac, name) 
                VALUES (?, ?, ?)", [@ip, @mac, @name])
  end
end
