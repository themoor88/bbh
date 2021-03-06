# frozen_string_literal: true
# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
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
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

# frozen_string_literal: true
class Admin < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Devise modules
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  #------------------------------------------------------------------------------
  # Associations

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
    list do
      field :id
      field :email
      field :created_at
    end

    show do
      field :id
      field :email
      field :created_at
    end

    edit do
      field :email
      field :password
    end

    export do
      field :id
      field :email
      field :created_at
    end
  end

  #------------------------------------------------------------------------------
  # private
end
