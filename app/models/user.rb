# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  role                   :string(255)
#  active                 :boolean          default(FALSE)
#  email                  :string(255)      default(""), not null
#  title                  :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  position               :string(255)
#  company                :string(255)
#  company_type           :string(255)
#  telephone              :string(255)
#  mobile                 :string(255)
#  address                :string(255)
#  country                :string(255)
#  number_of_employees    :string(255)
#  company_website        :string(255)
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
  has_many :likes

  #------------------------------------------------------------------------------
  # Enumerations
  classy_enum_attr :title, allow_nil: true, allow_blank: true
  classy_enum_attr :role, allow_nil: false, allow_blank: false
  classy_enum_attr :company_type, allow_nil: true, allow_blank: true

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
  def self.select_options_for_number_of_employees
    ['1-10', '11-50', '51-100', '100-500', '500-1000', '1000-5000', '5000-10 000', '10 000-50 000', '50 000+']
  end

  #------------------------------------------------------------------------------
  # Instance methods
  def active_for_authentication?
    super && active?
  end

  #------------------------------------------------------------------------------
  # Rails Admin Config
  rails_admin do
    configure :title, :enum do
      enum do
        Title.select_options
      end
    end

    configure :role, :enum do
      enum do
        Role.select_options
      end
    end
  end

  #------------------------------------------------------------------------------
  # private
end
