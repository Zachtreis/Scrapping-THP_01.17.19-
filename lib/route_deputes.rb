require 'nokogiri'
require 'open-uri'
require 'resolv-replace'

def get_deputy_emails(deputy_url)
	page = Nokogiri::HTML(open(deputy_url))   
    return page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[1]/a').text
    #return page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').text --> plrs emails colles les uns aux autres
end

def get_deputy_names_and_urls
    deputy_names =[]
	deputy_urls = []
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))  
	page.xpath('//*[@class="list_dep jstitle phototitle block"]').each do |var|
	  deputy_names <<  var.children[3].text.delete(" ").split(",")
	  deputy_urls << "https://www.nosdeputes.fr" + var.parent["href"]
	end
	return [deputy_urls, deputy_names]
end


def route_deputes 
    deputy_urls = get_deputy_names_and_urls[0]
    deputy_names = get_deputy_names_and_urls[1]
	hash_deputy = [] 

	deputy_urls.each_with_index do |deputy_url,i|
		hash_deputy << { "first_name" => deputy_names[i][1],"family_name" => deputy_names[i][0][1..-1], "email" => get_deputy_emails(deputy_url)}
    end
	return hash_deputy
end


