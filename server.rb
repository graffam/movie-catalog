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

# get '/movies' do
#   redirect 'movies/1'
#   erb :index
# end
#[{:id=>"2", :title=>"Troll 2", :year=>"1990", :synopsis=>"", :rating=>"0", :genre=>"Horror", :studio=>"MGM"},

get '/movies' do
  @movies = get_movies
  @movies.sort_by! {|index| index[:title]}
  erb :index
end

get '/movies/:movie_id' do

  @selected_movie = get_movies.find do |movie|
      movie[:id] == params[:movie_id]
  end
  erb :show
end
