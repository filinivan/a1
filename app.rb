#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Подключение базы данных
set :database, "sqlite3:a1.db"

class Word < ActiveRecord::Base 
end

get '/' do
	erb :index
end
