# frozen_string_literal: true
module ApplicationHelper
  def footer_and_legal_notes
    'Copyright 2015 - 2016 Baehl Innovation | All Rights Reserved | '
  end

  # Devise helper methods
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end
end
