require 'rack/test'
require 'rspec'
require 'byebug'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../controllers/application_controller.rb', __FILE__)

module RSpecMixin
  include Rack::Test::Methods

  def app
    ApplicationController
  end
end

RSpec.configure { |c| c.include RSpecMixin }
