# frozen_string_literal: true
# == Schema Information
#
# Table name: campaigns
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  title                   :string(255)
#  company_description     :text(65535)
#  company_needs           :text(65535)
#  sector                  :string(255)
#  country                 :string(255)
#  targeted_time_to_market :string(255)
#  expected_trl            :string(255)
#  state                   :string(255)
#  expires_at              :datetime
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
  has_many :likes

  #------------------------------------------------------------------------------
  # Enumerations
  classy_enum_attr :sector
  classy_enum_attr :state, allow_blank: false, allow_nil: false, default: :pending

  #------------------------------------------------------------------------------
  # Scopes
  scope :pending, -> { where(state: 'pending') }
  scope :active, -> { where(state: 'active') }
  scope :deleted, -> { where(state: 'deleted') }
  scope :expired, -> { where(state: 'expired') }

  #------------------------------------------------------------------------------
  # Validations

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

    configure :state, :enum do
      enum do
        State.select_options
      end
    end
  end

  #------------------------------------------------------------------------------
  # private
end
