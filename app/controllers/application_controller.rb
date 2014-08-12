class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter { |controller| configured(controller) }

  protected

  def configured controller
    return if params[:first_time] == 'true'
    redirect_to(controller: 'home', action: 'settings', first_time: true) if Setting.get(:name).nil?
  end
end
