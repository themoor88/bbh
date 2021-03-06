# frozen_string_literal: true
# == Schema Information
#
# Table name: visits
#
#  id               :integer          not null, primary key
#  visit_token      :string(255)
#  visitor_token    :string(255)
#  ip               :string(255)
#  user_agent       :text(65535)
#  referrer         :text(65535)
#  landing_page     :text(65535)
#  user_id          :integer
#  referring_domain :string(255)
#  search_keyword   :string(255)
#  browser          :string(255)
#  os               :string(255)
#  device_type      :string(255)
#  screen_height    :integer
#  screen_width     :integer
#  country          :string(255)
#  region           :string(255)
#  city             :string(255)
#  postal_code      :string(255)
#  latitude         :decimal(10, )
#  longitude        :decimal(10, )
#  utm_source       :string(255)
#  utm_medium       :string(255)
#  utm_term         :string(255)
#  utm_content      :string(255)
#  utm_campaign     :string(255)
#  started_at       :datetime
#
# Indexes
#
#  index_visits_on_user_id      (user_id)
#  index_visits_on_visit_token  (visit_token) UNIQUE
#

class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: 'Ahoy::Event'
  belongs_to :user
end
