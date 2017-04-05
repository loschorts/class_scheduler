class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	
	before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :toggle_language

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

	def toggle_language
		#TODO Broken
		cur = request.fullpath[3..-1]
		(I18n.locale == :en ? "/es" : "/en") + cur
	end

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
    	:email, :f_name, :l_name, :password, :password_confirmation, :language,
      :profile_src, :about, :profile_public_id
    	])

    devise_parameter_sanitizer.permit(:account_update, keys: [
    	:email, :f_name, :l_name, :password, :password_confirmation, :language,
      :profile_src, :about, :profile_public_id
    	])

  end

end
