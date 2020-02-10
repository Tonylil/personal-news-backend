class UsersController < ApplicationController
	def index
		@users = User.all
		render json: @users, only: [:id, :name, :email, :profile_pic],include: {interests: {only: [:id, :user, :interest]}}
	end

	def create
		whitelist = params.permit(:name, :username, :email, :password)

		@user = User.create(whitelist)
		if @user.valid?
			#Need to figure out Token
			token = @user.id
			render json: {user: @user, token: token}
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
		
		whitelist = params.permit(:username, :password)
		@user = User.find_by(username: whitelist[:username])

		if @user && @user.authenticate(whitelist[:password])
			#Need to figure out Token
			token = @user.id
			@interests = @user.interests
			render json: {user: @user, token:token, interest: @interests}
		else
			render json: {errors: "Wrong Username or Password"}
		end
	end

	def tokenlogin
		puts "Need to check token in future, for now assume token is ID"
		whitelist = params.permit(:token)
		@user = User.find(whitelist[:token])

		if @user
			@interests = @user.interests
			render json: {user: @user, interest: @interests}
		else
			render json: {errors: "Token Invald"}
		end
	end
end
