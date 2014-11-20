require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'csv'

get '/' do
  erb :index
end
