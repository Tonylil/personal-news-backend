class InterestsController < ApplicationController
	def create 
		whitelist = params.permit(:user, :interest)

		@interest = Interest.create(whitelist)
		if @interest.valid?
			render json: {interest: @interest}
		else
			render json: {errors: @interest.errors.full_messages}
		end
	end

	def destroy
		#Might want to check token here once i Get Auth working

		@interest = Interest.find(params[:id])
		@interest.delete

		render json: {interest: @interest}
	end
end
