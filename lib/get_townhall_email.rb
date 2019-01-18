require 'rubygems'
require 'nokogiri'         
require 'open-uri'


def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))

    emails_maires = []
    
    villes =[]
    page.xpath('//*[@class="lientxt"]').each do |ville|
        villes << ville.text
    end

    # puts villes


    faux_liens_villes =[]
    page.xpath('//*[@class="lientxt"]').each do |lien|
        faux_liens_villes << lien.values[1]
    end

    # puts faux_liens_villes

    liens_villes = faux_liens_villes.map{ |el| "http://annuaire-des-mairies.com" + el[1..-1]}

    # puts liens_villes

    emails = []
    for lien in liens_villes do 
        emails << Nokogiri::HTML(open(lien)).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
    end
    
    
    for i in (0...villes.length) do
        emails_maires << {"#{villes[i]}" => "#{emails[i]}"}
    end

    return emails_maires
   
end

#get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")
