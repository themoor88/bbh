# frozen_string_literal: true
# == Schema Information
#
# Table name: campaigns
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  title                   :string(255)
#  sub_title               :text(65535)
#  sector                  :string(255)
#  country                 :string(255)
#  targeted_time_to_market :string(255)
#  expected_trl            :string(255)
#  state                   :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_campaigns_on_user_id  (user_id)
#

class Campaign < ActiveRecord::Base
  include ClassyEnum::ActiveRecord
  #------------------------------------------------------------------------------
  # Associations
  belongs_to :user
  has_many :proposed_solutions

  #------------------------------------------------------------------------------
  # Enumerations
  classy_enum_attr :sector

  #------------------------------------------------------------------------------
  # Scopes

  #------------------------------------------------------------------------------
  # Validations
  # validates :title, :sub_title, :sector, :country, presence: true

  #------------------------------------------------------------------------------
  # Callbacks
  # after_create :send_email_to_admin

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # AASM definitions

  #------------------------------------------------------------------------------
  # Class methods

  #------------------------------------------------------------------------------
  # Instance methods

  #------------------------------------------------------------------------------
  # Rails Admin Config
  rails_admin do
    configure :sector, :enum do
      enum do
        Sector.select_options
      end
    end
  end

  #------------------------------------------------------------------------------
  # private
end
