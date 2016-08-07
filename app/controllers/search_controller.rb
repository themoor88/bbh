# frozen_string_literal: true
class SearchController < ApplicationController
  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def find_campaigns
    if current_user.role == :tech_provider
      @campaigns = Campaign.active
    elsif current_user.role == :tech_seeker || current_user.role == :consultant
      @campaigns = current_user.campaigns.not_deleted
    end

    if params[:country].present?
      @campaigns = @campaigns.where(country: params[:country].to_s)
    end

    if params[:order].present?
      @campaigns = @campaigns.order("expires_at #{params[:order]}")
    end

    if params[:sector].present?
      @campaigns = @campaigns.select { |campaign| campaign.sector.values.include? params[:sector] }
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end
