# frozen_string_literal: true
# == Schema Information
#
# Table name: slider_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  link       :string(255)
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SliderItem < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Associations

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # Scopes
  scope :active, -> { where(active: true) }

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
