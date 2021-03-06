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
  FileUtils.mv(tempfile.path, "#{Dir.pwd}/downs/#{tempfile.original_filename}.mp3")
  puts "Done #{link}"
end

