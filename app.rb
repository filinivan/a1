#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Подключение базы данных
set :database, "sqlite3:a1.db"

class Words < ActiveRecord::Base
	validates :word, presence: true, uniqueness: true
	validates :translate, presence: true
end

get '/' do
	#@words = Word.order "created_at DESC"
#	@words = Word.find(params[:id])
	erb :index
end

get '/add' do
	erb :add
end

post '/add' do
  @w = Words.new params[:word]

  if @w.save
    erb :add
  else
    @error = @w.errors.full_messages.first
    erb :add
  end
	end

	get '/learn' do
		@words = Words.order "created_at DESC"
		erb :learn
	end
