class BookingsController < ApplicationController
	before_action :set_booking, only: %i[ show edit update destroy ]

	
	def index
		@bookings=current_user.bookings
	end

	def edit
	end

	def show
		
	end

	def new
		@booking=Booking.new
	end


	def create
		@booking=current_user.bookings.build(booking_params)
		if @booking.save
			flash[:notice]="booking successfully created."
			redirect_to @booking			
		else
			render 'new'
		end

	end

	def update
		if @booking.update(booking_params)
			flash[:notice]="Booking Updated successfully"
			
			redirect_to @booking
		else
			render 'edit'
		end
	end

	def destroy
		@booking.destroy
		#redirect_to bookings_path
	end

	def pastbookings
		@current_user=current_user
		@bookings=@current_user.bookings

	end

	def futurebookings
		@bookings=current_user.bookings
	end


	private
    
    def set_booking
      @booking = Booking.find(params[:id])
    end

   
    def booking_params
      params.require(:booking).permit(:start, :end, :price, :property_id)
    end



end
