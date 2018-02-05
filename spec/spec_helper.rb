require 'rack/test'
require 'rspec'
require 'byebug'

ENV['RACK_ENV'] = 'test'

Dir.glob(File.expand_path('lib/{controlers}/*.rb')).reverse.each {|file| require file }

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_app
  end
end

Rspec.configure { |c| c.include RSpecMixin }
