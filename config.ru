require 'sinatra/base'

Dir.glob('./controllers/*.rb').reverse.each { |file| require file }

# map the controllers to routes
map('/') { run ApplicationController }
