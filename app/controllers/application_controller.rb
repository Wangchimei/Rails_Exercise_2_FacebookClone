class ApplicationController < ActionController::Base
  # before_action :logged_in_status

  protect_from_forgery with: :exception
  include SessionsHelper
end
