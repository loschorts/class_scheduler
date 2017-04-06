class UsersController < Devise::RegistrationsController

	def new
		super
	end
	def create
		super
		set_errors
	end

	def update
		super
		set_errors
	end

	private

	def set_errors
		flash[:errors] << "record not saved" if @user.errors 
	end
  
end
