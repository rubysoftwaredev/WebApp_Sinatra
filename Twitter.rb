require 'rubygems'
require 'httparty'

##### HTTParty basic code
#response = HTTParty.get('http://twitter.com/statuses/public_timeline.json')

#response.each do |item|
#  puts item['user']['screen_name']
#   puts item
#end


######## wrapped
module Twitter

  include HTTParty
  base_uri 'twitter.com'
  

  def Twitter.  create_single_entry( screen_name,
                    user_img_url,
                    item_id,
                    pub_timestamp,
                    user_message_origin,
                    user_status)

        puts " \<li class=\"hentry u-" +screen_name + "status\"" + "id=\"status_"+item_id+"\"\>" 

        puts " \<span class=\"thumb vcard author\"\>"
        puts " \<a href=\"https:\/\/twitter.com\/" + screen_name + "\" class =\"tweet-url profile-pic url\"\>"
        puts " \<img alt=\" Twitter Feed\" class=\"photo fn\" height=\"48\" src=\"" + user_img_url + " \" width=\"48\" \/\>\<\/a\>\<\/span\>  "

        puts "\<span class=\"status-body\"\>"
        puts "\<span class=\"status-content\"\>"
        puts "\<strong\>\<a href=\"https:\/\/twitter.com\/" + screen_name + "\" class=\"tweet-url screen-name\"\>" + screen_name + "\<\/a\>\<\/strong\>"
        
        puts "\<span class=\"entry-content\"\>" + user_status + "\<\/span\>"
        puts "\</span\>"
        puts "\<span class=\"meta entry-meta\" data=\'\{\}\'\>"
        puts "\<a class=\"entry-date\" rel=\"bookmark\" href=\"https:\/\/twitter.com\/" + screen_name + "\/status\/" + item_id + "\"\>"
        puts "\<span class=\"published timestamp\" data=\"\{time:\'" + pub_timestamp + " \'\}\"\>Fix time \<\/span\>\<\/a\>"
        puts "\<span\>via web\<\/span\>"
    
        puts "\<\/span\>"

        puts "\<ul class=\"meta-data clearfix\"\>"
        puts "\<\/ul\>"
        puts " \<\/span\>"

#        puts screen_name
#        puts user_img_url
#        puts item_id
#        puts pub_timestamp
#        puts user_message_origin
#        puts user_status

  end

  def self.public_timeline()
        current_timeline = get('/statuses/public_timeline.json')
        
         
         puts "\<html\>"
         puts "\<link href=\"https://si0.twimg.com/a/1338938880/stylesheets/twitter.css?1338399793\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"
         puts "\<body\>"


         puts "\<div\>"
         puts "\<table cellspacing=\"0\" class=\"columns\"\>"
         puts "\<tbody>"
         puts "\<tr\>"
         puts "\<td id=\"content\" class=\"round-left column\"\>"
         puts "\<div class=\"wrapper\"\>"
         puts "\<div class=\"tab\"\>"
         puts "\<h2 class=\"timeline-header\"\> Recent Public Tweets\<\/h2\>"
         puts "\<div class=\"badgebox\"\>"
         puts "\<h3 class=\"timeline-subheader\"\>What everyone on Twitter is talking about!\<\/h3\>"
         puts "\<\/div\>"
         puts "\<ol id=\'timeline\' class=\'statuses\'\>"

        current_timeline.each do |item|
          user_name=item['user']
          screen_name = item['user']['screen_name']
          user_img_url = item['user']['profile_image_url_https']
          item_id = item['id_str']
          pub_timestamp = item['created_at']
          user_message_origin = item['source']
          user_status = item['text']

          create_single_entry( screen_name,
               user_img_url,
               item_id,
               pub_timestamp,
               user_message_origin,
               user_status
               )
        end

        puts "\<\/ol\\>"
        puts "\<\/div\\>"
        puts "\<\/div\\>"
        puts "\<\/td\\>"
        puts "\<\/div\\>"
        puts "\<\/div\\>"
        puts "\<\/td\\>"
        puts "\<\/tr\\>"
        puts "\<\/tbody\\>"
        puts "\<\/table\\>"
        puts "\<\/div\\>"
        puts "\<\/body\\>"
        puts "\<\/html\\>"

#       puts screen_name
#       puts user_img_url
#       puts item_id
#       puts pub_timestamp
#       puts user_message_origin
#       puts user_status

        
   end

end



Twitter.public_timeline

#Twitter.public_timeline.each do |item|
#  puts "===="
#  user_name=item['user']
#  screen_name = item['user']['screen_name']
#  user_img_url = item['user']['profile_image_url_https']
#  item_id = item['id']
#  pub_timestamp = item['created_at']
#  user_message_origin = item['source']
#  user_status = item['text']
#
#  create_single_entry(screen_name,
#                      usr_img_url,
#                      item_id,
#                      pub_timestamp,
#                      user_status,
#                      user_message_origin)
#
#
#  puts "===="
#end
#  
#
