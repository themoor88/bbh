# frozen_string_literal: true
# == Schema Information
#
# Table name: proposed_solutions
#
#  id               :integer          not null, primary key
#  tech_provider_id :integer
#  campaign_id      :integer
#  name             :string(255)
#  description      :text(65535)
#  state            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_proposed_solutions_on_campaign_id       (campaign_id)
#  index_proposed_solutions_on_tech_provider_id  (tech_provider_id)
#

# frozen_string_literal: true
class ProposedSolution < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Associations
  belongs_to :tech_provider
  belongs_to :campaign

  #------------------------------------------------------------------------------
  # Scopes

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

  #------------------------------------------------------------------------------
  # private
end
