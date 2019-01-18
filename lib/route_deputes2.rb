require 'nokogiri'
require 'open-uri'
require 'resolv-replace'

def get_deputy_names
    page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=577"))
    depute_full_name = []
    depute_first_name = []
    depute_last_name = []       
    page.xpath('//*[@id="content"]/div[1]/ul/li[1]/h2').each do |name|                    
        depute_full_name << name.text                                                       
    end
    for i in (0...depute_full_name.length) do
        depute_first_name << depute_full_name[i].split(" ")[1]
        depute_last_name << depute_full_name[i].split(" ")[2]
    end
    return [depute_first_name, depute_last_name]
end

def deputy_list
    depute_first_name = get_deputy_names[0]
    depute_last_name = get_deputy_names[1]
    deputy_list = []
    for i in (0...577) do
        deputy_list << {"first_name" => depute_first_name[i], "last_name" => depute_last_name[i], "email" => depute_first_name[i]+"."+depute_last_name[i]+"@assemblee-nationale.fr"}
    end
    return deputy_list
end 

