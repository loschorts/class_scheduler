class ApplicationController < ActionController::Base
	before_action :set_locale
  protect_from_forgery with: :exception

  def user_params
		params.require(:user).permit(
			:email, 
			:password, 
			:phone_number, 
			:f_name, 
			:l_name, 
			:type, 
			:image, 
			:profile_src,
			:language
		)
	end

	def authenticate_user_is_tutor
		current_api_user.is_a?(Tutor)
	end


	
	 
	def set_locale
	  I18n.locale = extract_locale_from_subdomain || I18n.default_locale
	end
	 
	def extract_locale_from_subdomain
		return unless params[:locale]
	  I18n.available_locales.include?(params[:locale].to_sym) ? 
	  	params[:locale].to_sym : nil
	end

	def default_url_options
	  { locale: I18n.locale }
	end


end
