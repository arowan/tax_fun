require 'sinatra'
require 'json'
require_relative '../lib/calculate'

class ApplicationController < Sinatra::Base
  get '/' do
    content_type :json
    {"message" => "request a report /report?income=XXXXX"}.to_json
  end

  get '/report' do
    content_type :json
    ::Calculate::Report.new(params[:income]).to_json
  end
end
