# frozen_string_literal: true
class SearchController < ApplicationController
  def find_campaigns
    if current_user.role == :tech_provider
      @campaigns = Campaign.active
    elsif current_user.role == :tech_seeker
      @campaigns = current_user.campaigns.not_deleted
    end

    if params[:country].present?
      @campaigns = @campaigns.where(country: "#{params[:country]}")
    end

    if params[:order].present?
      @campaigns = @campaigns.order("expires_at #{params[:order]}")
    end

    if params[:sector].present?
      @campaigns = @campaigns.where(sector: "#{params[:sector]}")
    end
  end
end
