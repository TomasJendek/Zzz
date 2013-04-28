# -*- encoding : utf-8 -*-
require 'open-uri'
require 'net/http'
require 'cgi'



class Parser

  def regionParser
    begin
      #doc = Nokogiri::HTML(open("http://www.zzz.sk/?mesto=Bratislava"))
      #doc.encoding = 'UTF-8'

      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      valid_string = ic.iconv(open("http://www.zzz.sk/?mesto=Pezinok" ).read)
      doc = valid_string
    rescue OpenURI::HTTPError => ex
      return
    end


  end

  def ambulanceTypeParser
    begin
      doc = Nokogiri::HTML(open("http://www.zzz.sk/?mesto=Pezinok"))
    rescue OpenURI::HTTPError => ex
      return
    end

    region = Region.new(:name => "pezinok")
    region.save

    nodes = doc.xpath('//div[@id="mainContent"]')
    nodes = nodes.xpath('//table')

    nodes.each do |item|
      row = item.css('tr').css('td').css('p')
      row.each do |r|
        link = r.css('a').xpath('@href').to_s # ambulance type link link
        name = r.css('a').text.strip if !r.css('a').text.nil? # ambulance type name



        if !name.empty?
          ambulance = Ambulance.new(:specialization => name, :region_id => Region.find(2).id, :link => link)
          ambulance.save

          ambulanceItemParser(link, ambulance.id)
        end

      end
    end

    #am = Ambulance.find(1)
    #puts am.inspect
  end

  def ambulanceItemParser(link, id)
    begin
      doc = Nokogiri::HTML(open("http://www.zzz.sk/"+link))
    rescue OpenURI::HTTPError => ex
      return
    end

    nodes = doc.xpath('//div[@id="mainContent"]')
    nodes = nodes.xpath('//p[@class="div_x_ram"]')



    nodes.each do |item|
      link = item.css('a').xpath('@href').to_s # ambulance type link link
      doctor = item.to_s.split("<br>")[1].to_s.encode("utf-8")
      doctor_slice ='<a href="?'+link.split('?')[2].to_s+'" target="_blank" style="color:black;text-decoration:none;">[otvoriť zariadenie]</a>'
      doctor.slice!doctor_slice

      name = item.css('a').text.strip.encode("utf-8")
      name.slice!"[otvoriť zariadenie]"

      address =  item.to_s.split("<br>")[3].to_s.delete("</p>").encode("utf-8")

      ambulance_item = AmbulanceItem.new(:name => name, :link => link, :doctor => doctor, :address => address, :ambulance_id => id)
      ambulance_item.save
    end

  end
end
