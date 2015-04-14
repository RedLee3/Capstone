require 'nokogiri'
require 'sqlite3'

xml = ARGV[0]

file = File.open xml

xml_doc = Nokogiri::XML(file)

db = SQLite3::Database.new("openvas_db")

xml_doc.css("results").children.each do |result|
	host = result.css("host").text
	port = result.css("port").text
	severity = result.css("severity").text
	cve = result.css("cve").text
	#Host ip, affected port, severity, cve
	#puts "#{result.css("host").text};#{result.css("port").text};#{result.css("severity").text};#{result.css("cve").text}"
	db.execute( "INSERT into TABLE (host,port,severity,cve) VALUES(?,?,?,?)",@host,@port,@severity,@cve )
end
