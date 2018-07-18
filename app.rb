require 'sinatra'

get '/' do
  'Hello world'
  erb :login
end