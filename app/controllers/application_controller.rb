class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

protected
  def initialize_twitter_search
    @twitter_search = Twitter::Search.new
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || extract_locale_from_accept_language_header || :ja
    if session[:locale] && session[:locale] != I18n.locale
      flash.now[:notice] = t('notices.language_changed', :language => t("locales.#{session[:locale]}"))
    end
    session[:locale] = I18n.locale
    logger.debug "* Locale set to '#{I18n.locale}'" if Rails.env.development?
  end
private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).each do |locale|
      return locale.to_sym if Yamadb::LOCALES.include?(locale)
    end if request.env['HTTP_ACCEPT_LANGUAGE']
  end
end
