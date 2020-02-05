class UsersController < ApplicationController
	def index
		@users = User.all
		render json: @users, only: [:id, :name, :email, :profile_pic],include: {interests: {only: [:id, :user, :interest]}}
	end

	def create
		whitelist = params.permit(:name, :username, :email, :password)

		@user = User.create(whitelist)
		if @user.valid?
			render json: @user
		else
			render json: {errors: @user.errors.full_messages}
		end
	end

	def show
		puts "Need to check token somehow, auth stuff"
		@user = User.find(params[:id])
		render json: @user
	end

	def login
		puts "Time to do Auth...lol"
	end
end
