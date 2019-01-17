require 'rubygems'
require 'nokogiri'         
require 'open-uri'

#page = Nokogiri::HTML(open("index.html"))   (if index.html is a file on your computer)
#puts page.class   # => Nokogiri::HTML::Document
   
   
page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document

#also works with
=begin require 'restclient'

page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document =end
      