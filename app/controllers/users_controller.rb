class UsersController < ApplicationController
	def index
		@users = User.all
		render json: @users, only: [:id, :name, :email, :profile_pic],include: {interests: {only: [:id, :user, :interest]}}
	end

	def create
		whitelist = "LOL this is gonna be annoying to do"

		@User = User.create(whitelist)
		if @User.valid?
			render json: @User
		else
			render json: {errors: @User.errors.full_messages}
		end
	end

	def show
		puts "Need to check token somehow, auth stuff"
	end

	def login
		puts "Time to do Auth...lol"
	end
end
