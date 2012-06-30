#Straw - A tool for sucking lists out of Twitter.
-----------------
A very simple sinatra app that takes a given Twitter list and dumps the list members information into a CSV file. Useful recruiting tool.

##Getting Started

1. git clone git@github.com:ejc/straw.git
2. bundle install
3. cd straw
4. Open a browser, visit the URL http://localhost:4567/screenname/list/category - where screenname is the Twitter screen name of the list owner and "list" is the name of the list. "category" prepends an identifying category to the beginning of the csv filename.

------------------
##TODO
1. Add Web interface
2. Add ability to save to DB