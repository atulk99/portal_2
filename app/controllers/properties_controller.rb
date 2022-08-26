class PropertiesController < ApplicationController
	before_action :set_property, only:[ :show, :edit, :update, :destroy, :bookings]


	def index
		@properties=current_user.properties
	end

	def new
		@property=Property.new
	end
	
	def show
	end

	def edit
	end


	def create

		@property=Property.new(property_params)
		
		@property.user_id =current_user.id

		if @property.save
			flash[:notice]="Successfully added"
			redirect_to properties_path
		end
	end

	def update
		if @property.update(property_params)
			redirect_to property_path(@property)
		end
	end

	def bookings
		@booking = @property.bookings
	end
	
	def destroy
		@property.destroy
		flash[:notice]="Property Deleted"
	end

	private
    
    def set_property
      @property = Property.find(params[:id])
    end

   
    def property_params
      params.require(:property).permit(:name, :address, :latitude, :longitude)
    end

end
