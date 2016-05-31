# frozen_string_literal: true
module Accessible
  extend ActiveSupport::Concern

  protected

  def check_user
    flash.clear
    if current_admin
      redirect_to rails_admin.dashboard_path && return
    elsif current_user
      redirect_to root_path && return
    end
  end
end
