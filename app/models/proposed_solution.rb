# frozen_string_literal: true
# == Schema Information
#
# Table name: proposed_solutions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  campaign_id :integer
#  name        :string(255)
#  description :string(255)
#  state       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_proposed_solutions_on_campaign_id  (campaign_id)
#  index_proposed_solutions_on_user_id      (user_id)
#

class ProposedSolution < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Associations
  belongs_to :user
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
