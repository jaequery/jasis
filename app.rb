require 'sinatra'
require './config.rb'

get '/' do
  erb :index
end

get '/about' do
  "wow"
end

get '/ga' do
  "ga"
end

get '/omg' do
  'omg'
end

get '/w' do
  "gas"
end