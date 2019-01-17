require 'rubygems'
require 'nokogiri'         
require 'open-uri'


def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open("townhall_url"))

    


