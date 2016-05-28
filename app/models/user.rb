# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  role                   :string(255)
#  email                  :string(255)      default(""), not null
#  first_name             :string(255)
#  last_name              :string(255)
#  position               :string(255)
#  company                :string(255)
#  company_type           :string(255)
#  telephone              :string(255)
#  mobile                 :string(255)
#  address                :string(255)
#  country                :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  include ClassyEnum::ActiveRecord
  #------------------------------------------------------------------------------
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  #------------------------------------------------------------------------------
  # Associations
  has_many :campaigns
  has_many :proposed_solutions

  #------------------------------------------------------------------------------
  # Enumerations
  classy_enum_attr :role, allow_nil: false, allow_blank: false

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
  rails_admin do
    configure :country, :enum do
      enum do
        # country_select('user', 'country')
      end
    end
  end
  #------------------------------------------------------------------------------
  # private
end
