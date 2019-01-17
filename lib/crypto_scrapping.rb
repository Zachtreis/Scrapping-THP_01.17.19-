require 'rubygems'
require 'nokogiri'         
require 'open-uri'


def crypto_scrapper
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    cours_monnaies = []
    symbols =[]
    page.xpath('//*[@class="text-left col-symbol"]').each do |symbol|
        symbols << symbol.text
    end

    prices = []
    page.xpath('//*[@class="price"]').each do |price|
        prices << price.text
    end

    for i in (0...symbols.length) do
        cours_monnaies << {"#{symbols[i]}" => prices[i]}
    end

    return cours_monnaies
end
