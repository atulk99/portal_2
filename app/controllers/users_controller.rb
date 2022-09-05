class UsersController < ApplicationController
	def show
	end

	private
    
    def set_property
      @user = User.find(params[:id])
    end

end