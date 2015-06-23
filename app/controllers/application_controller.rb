class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
  before_filter :set_locale

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def set_locale
      I18n.locale = extract_locale_from_subdomain || I18n.default_locale
    end

    def extract_locale_from_subdomain
      if parsed_locale = request.subdomains.first
        I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
      end
    end

end
