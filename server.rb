require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'csv'

def get_movies
  data = []
  CSV.foreach('movies.csv',headers: true, header_converters: :symbol) do |row|
    data << row.to_hash
  end
  data
end

get '/' do
  @movies = get_movies
  binding.pry
  erb :indexß
end

get '/movies' do
  erb :index
end
