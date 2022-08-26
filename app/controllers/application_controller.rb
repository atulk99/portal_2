class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)

		# binding.pry
		# current_user.roles.destroy_all

		role = Role.find_by(field: params[:user][:roles])
		# binding.pry   	
   	current_user.roles << role if role !=nil

   	# binding.pry
   	if current_user.roles.first.field == 'Customer'
        return bookings_path
    elsif current_user.roles.first.field == 'Property Owner'
        return properties_path
    end

	end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :account, :phone) } 
    end
end
