require 'sinatra'
require 'json'

class ApplicationController < Sinatra::Base

  get '/' do
    content_type :json
    {"message" => "POST an income to /report"}.to_json
  end

  post '/report' do
    content_type :json
    Calculator::Report.new(params[:income]).to_json
  end
end
