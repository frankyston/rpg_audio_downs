# http://docs.seattlerb.org/mechanize/GUIDE_rdoc.html
# https://stackoverflow.com/questions/29292643/scraping-a-site-that-requires-login-username-and-password-on-two-separate-pages
# https://www.twilio.com/blog/download-image-files-ruby

require "down"
require "fileutils"
require 'JSON'

require 'pry'

links = [];

file = File.read("#{Dir.pwd}/musics.json")
arr = JSON.parse(file)

arr.first[1].each do |audio|
  links << audio
end

links.each do |link|
  tempfile = Down.download link, 
    content_length_proc: -> (content_length) { puts "Iniciando download: #{content_length} k" },
    progress_proc:       -> (progress)       { puts "Down: #{progress} k" }
  FileUtils.mv(tempfile.path, "/Users/frankyston/Desktop/downs/#{tempfile.original_filename}.mp3")
  puts "Done #{link}"
end

