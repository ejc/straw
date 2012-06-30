require 'rubygems'
require 'sinatra'

require './straw'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/publi'

run Sinatra::Application
