# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # try going to the previous URL for the particular resoruce if one exists
    redirect_location = stored_location_for(resource)
    if redirect_location.present?
      redirect_location
    elsif resource.is_a? TechSeeker
      dashboard_campaigns_path
    elsif resource.is_a? TechProvider
      campaigns_path
    elsif resource.is_a? Admin
      rails_admin.dashboard_path
    else
      super
    end
  end
end
