require 'open-uri'
require 'net/http'
require 'cgi'

class Parser

  def initialize
    begin
      doc = Nokogiri::HTML(open("http://www.zzz.sk/?mesto=Bratislava"))
    rescue OpenURI::HTTPError => ex
      return
    end

    puts doc.to_s
  end
end