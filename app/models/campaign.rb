# frozen_string_literal: true
# == Schema Information
#
# Table name: campaigns
#
#  id             :integer          not null, primary key
#  tech_seeker_id :integer
#  name           :string(255)
#  description    :text(65535)
#  state          :string(255)
#  expires_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_campaigns_on_tech_seeker_id  (tech_seeker_id)
#

# frozen_string_literal: true
class Campaign < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Associations
  belongs_to :tech_seeker
  has_many :proposed_solutions, dependent: :destroy

  #------------------------------------------------------------------------------
  # Scopes

  #------------------------------------------------------------------------------
  # Validations

  #------------------------------------------------------------------------------
  # Callbacks

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

  #------------------------------------------------------------------------------
  # private
end
