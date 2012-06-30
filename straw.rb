# Straw is a tool for sucking lists out of Twitter

 require 'rubygems'
 require 'sinatra'
 require 'twitter'
 require 'csv'

set :server, %w[thin]


###------------------------------
### Dump into the database
###-----------------------------                                                                      
get '/list_csv/:user/:list/:list_type' do |user, list, list_type|
  
  #Create a new CSV named after the user and the list
  CSV.open("public/csvs/#{list_type}_#{user}_#{list}.csv", "w") do |csv|
    csv << ["Name", "Location", "Screen Name",  "Bio", "Url", "Friends", "Followers", "Picture"]
    cursor = -1
    until cursor == 0
      
      # Grab the hash of list members
      list_members = Twitter.list_members(user, list, :cursor => cursor)
      
      # loop through list members and dump a new line into the CSV
      list_members.users.threaded_map do |list_member|
        csv << [list_member[:name], list_member[:location], "@" + list_member[:screen_name], list_member[:description], list_member[:url], list_member[:friends_count], list_member[:followers_count], list_member[:profile_image_url] ]
      end
      
      # Get the next Twitter list cursor
      cursor = list_members.next_cursor
    end
  end
end


