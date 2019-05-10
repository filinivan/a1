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
	@bad_rating = Words.order(id: :desc)	
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
		@word = Words.limit(1).order("RANDOM()")
		erb :learn
	end

	post '/learn' do
			@answer = params[:answer]

			if @answer["ru"] == @answer["de"]
				rating = Words.find_by(id: @answer["id"])
				rating_num = rating["rating"] + 1
				rating.update(rating: rating_num)
				@word = Words.limit(1).order("RANDOM()")
				erb :learn
			else
				rating = Words.find_by(id: @answer["id"])
				rating_num = rating["rating"] - 1
				rating.update(rating: rating_num)
				@word_by_id = Words.find(@answer["id"])
				erb :answer
			end

	end
