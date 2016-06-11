# frozen_string_literal: true
# == Schema Information
#
# Table name: proposed_solutions
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  campaign_id            :integer
#  link                   :string(255)
#  attachment             :string(255)
#  technology_description :text(65535)
#  technology_application :text(65535)
#  patents                :text(65535)
#  trl                    :string(255)
#  licence_available      :boolean
#  institution            :string(255)
#  expectations           :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
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
  validates :user_id, :campaign_id, :link, :attachment, :technology_description, :technology_application, :trl, presence: true

  #------------------------------------------------------------------------------
  # Callbacks
  # after_create :send_email_to_admin

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # AASM definitions

  #------------------------------------------------------------------------------
  # Class methods
  def self.trl_options
    ['TRL 0: Idea',
     'TRL 1: Basic research',
     'TRL 2: Technology formulation',
     'TRL 3: Applied research',
     'TRL 4: Small scale prototype',
     'TRL 5: Large scale prototype',
     'TRL 6: Prototype system',
     'TRL 7: Demonstration system',
     'TRL 8: First of a kind commercial system',
     'TRL 9: Full commercial application']
  end

  #------------------------------------------------------------------------------
  # Instance methods

  #------------------------------------------------------------------------------
  # Rails Admin Config

  #------------------------------------------------------------------------------
  # private
end
