class InterestsController < ApplicationController
	def create 
		@user = User.find(params[:user_id])

		#TODO: Want to check user with token
		#If user is valid, then we create the interest
		if @user.valid?
			interest = params[:interest]

			@interest = Interest.create({user: @user, interest: interest})
			if @interest.valid?
				render json: {interest: @interest}
			else
				render json: {errors: @interest.errors.full_messages}
			end
		else
			render json: {errors: @user.errors.full_messages}
		end

	end

	def destroy
		#Might want to check token here once i Get Auth working

		@interest = Interest.find(params[:id])
		@interest.delete

		render json: {interest: @interest}
	end
end
