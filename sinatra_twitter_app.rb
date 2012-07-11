## This is the file to be executed

require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra/base'


class MyTwitterApp < Sinatra::Base

   # the default setting for public folder is a dir named public in ROOT
   # __FILE__ is the directory containing this file

   set :root,File.dirname(__FILE__)
   set :public_folder, settings.root + '/public'
   

   get '/default_html/twitter_action_code' do
      'hello twitter feed'
      twitter_folder = settings.public_folder + 'twitter_html' 
      send_file File.expand_path('current_timeline_gen.html',settings.public_folder)
      send_file File.expand_path('twitter_selection_menu.html',twitter_folder )
#     File.read (File.join('public',index.html))
   end


   get '/' do
     begin
       puts "in default get request handler"
       send_file File.expand_path('index.html',settings.public_folder)

     rescue => err
      puts "Exception while reading file: #{err}"
      err
     end
   end

#   get '/about' do
#     'About Hello World Sinatra'
#   end
   
end


MyTwitterApp.run!
