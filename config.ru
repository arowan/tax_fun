require 'sinatra/base'

# Dir.glob('./controllers/*.rb').reverse.each { |file| require file }
require File.expand_path('../controllers/application_controller.rb', __FILE__)
# require File.expand_path('../lib/calculate.rb', __FILE__)


# map the controllers to routes
map('/') { run ApplicationController }
