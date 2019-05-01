#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Подключение базы данных
set :database, "sqlite3:a1.db"

class Words < ActiveRecord::Base
end

get '/' do
#	@words = Word.find(params[:id])
	erb :index
end

get '/add' do
	erb :add
end

post '/add' do
  @w = Words.new params[:word]

  if @w.save
    erb "Вы записаны"
  else
    @error = @w.errors.full_messages.first
    erb :add
  end

end
