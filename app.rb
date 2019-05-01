#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

#Подключение базы данных
set :database, "sqlite3:a1.db"

get '/' do
	erb :index
end
