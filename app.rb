require 'sinatra'
require_relative 'calc.rb'
# load './local_env.rb' if File.exist?('./local_env.rb')

enable :sessions

get '/' do

	erb :login, locals:{error: ""}
end

post '/log' do
	username = params[:username]
	password = params[:password]
	user1 = "Admin"
	user2 =	"Class"
	user3 =	"Teacher"
	pass1 = "Admin"
	pass2 = "Minedminds"
	pass3 = "Learn"
	if username == user1 && password == pass1
		redirect '/calc'
	elsif username == user2 && password == pass2
		redirect '/calc'
	elsif username == user3 && password == pass3
		redirect '/calc'
	elsif username != user1 && username != user2 && username != user3 && password != pass1 && password != pass2 && password != pass3
		
		error = "Inavlid Username and Password"
		erb :login, locals:{error: "Inavlid Username and Password"}

	elsif username != user1 && username != user2 && username != user3 
		error = "Invalid Username"
		erb :login, locals:{error: "Inavlid Username"}
	elsif password != pass1 && password != pass2 && password != pass3
		error = "Inavlid Password"
		erb :login, locals:{error: "Invalid Password"}
	end


end

get '/calc' do
	val1 = session[:val1] || ""
	val2 = session[:val2] || ""
	operation = session[:operation] || ""
	result = session[:result] || false
  erb :calc, locals:{result: result, val1: val1, val2: val2, operation: operation}
end

post '/calculate' do

	session[:val1] = params[:val1]
	session[:val2] = params[:val2]
	case params[:operation]
	when "add"
		session[:operation] = "+"
	when "subtract"
		session[:operation] = "-"
	when "multiply"
		session[:operation] = "x"
	when "divide"
		session[:operation] = "/"
	end
	session[:result] = resp1(params[:operation],params[:val1],params[:val2])
	redirect '/calc'
end

get '/forgot' do
	erb :forgot
end