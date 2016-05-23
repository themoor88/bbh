# frozen_string_literal: true
module Accessible
  extend ActiveSupport::Concern

  protected

  # rubocop:disable CyclomaticComplexity, PerceivedComplexity
  def check_user
    flash.clear
    if current_admin
      redirect_to(rails_admin.dashboard_path) && return
    elsif current_tech_seeker
      redirect_to(authenticated_tech_seeker_root_path) && return
    elsif current_tech_provider
      redirect_to(authenticated_tech_provider_root_path) && return
    end
  end
  # rubocop:enable CyclomaticComplexity, PerceivedComplexity
end
