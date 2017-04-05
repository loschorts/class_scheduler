module DeviseHelper
  def devise_error_messages!
  	errors = resource.errors.full_messages
  	flash[:error] = "Your form was not saved." if errors.length > 0
  end
end