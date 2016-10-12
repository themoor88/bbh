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
#  interests              :string(255)
#  position               :string(255)
#  company                :string(255)
#  telephone              :string(255)
#  mobile                 :string(255)
#  address                :string(255)
#  zip_code               :string(255)
#  city                   :string(255)
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
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  include ClassyEnum::ActiveRecord
  extend Enumerize
  delegate :url_helpers, to: 'Rails.application.routes'
  serialize :interests, Array

  #------------------------------------------------------------------------------
  # Devise modules
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  #------------------------------------------------------------------------------
  # Associations
  has_many :campaigns
  has_many :proposed_solutions
  has_many :likes
  has_many :visits

  #------------------------------------------------------------------------------
  # Enumerations
  classy_enum_attr :title, allow_nil: true, allow_blank: true
  classy_enum_attr :role, allow_nil: false, allow_blank: false
  enumerize :interests, in: [:devices, :cosmetic, :ehealth, :pharmaceuticals, :biopharmaceuticals, :agrifood, :aerospace, :automotive, :bioproducts, :chemicals, :digital_tech, :machinery_equipment, :energy, :telecom, :nutraceuticals, :other], multiple: true, i18n_scope: 'sector'

  #------------------------------------------------------------------------------
  # Scopes

  #------------------------------------------------------------------------------
  # Validations
  validates :title, :first_name, :last_name, :role, :position, :company, :telephone, :address, :city, :country, :number_of_employees, :company_website, presence: true

  #------------------------------------------------------------------------------
  # Callbacks
  after_create :send_email_to_admin
  after_update :send_email_to_user_on_activation, :send_email_to_user_old_email, :send_email_to_admin_on_email_change

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # AASM definitions

  #------------------------------------------------------------------------------
  # Class methods
  # rubocop:disable MethodLength
  def self.country_options
    [
      { id: 'Afghanistan', text: 'Afghanistan' },
      { id: 'Aland Islands', text: 'Aland Islands' },
      { id: 'Albania', text: 'Albania' },
      { id: 'Algeria', text: 'Algeria' },
      { id: 'American Samoa', text: 'American Samoa' },
      { id: 'Andorra', text: 'Andorra' },
      { id: 'Angola', text: 'Angola' },
      { id: 'Anguilla', text: 'Anguilla' },
      { id: 'Antarctica', text: 'Antarctica' },
      { id: 'Antigua And Barbuda', text: 'Antigua And Barbuda' },
      { id: 'Argentina', text: 'Argentina' },
      { id: 'Armenia', text: 'Armenia' },
      { id: 'Aruba', text: 'Aruba' },
      { id: 'Australia', text: 'Australia' },
      { id: 'Austria', text: 'Austria' },
      { id: 'Azerbaijan', text: 'Azerbaijan' },
      { id: 'Bahamas', text: 'Bahamas' },
      { id: 'Bahrain', text: 'Bahrain' },
      { id: 'Bangladesh', text: 'Bangladesh' },
      { id: 'Barbados', text: 'Barbados' },
      { id: 'Belarus', text: 'Belarus' },
      { id: 'Belgium', text: 'Belgium' },
      { id: 'Belize', text: 'Belize' },
      { id: 'Benin', text: 'Benin' },
      { id: 'Bermuda', text: 'Bermuda' },
      { id: 'Bhutan', text: 'Bhutan' },
      { id: 'Bolivia', text: 'Bolivia' },
      { id: 'Bosnia And Herzegovina', text: 'Bosnia And Herzegovina' },
      { id: 'Botswana', text: 'Botswana' },
      { id: 'Bouvet Island', text: 'Bouvet Island' },
      { id: 'Brazil', text: 'Brazil' },
      { id: 'British Indian Ocean Territory', text: 'British Indian Ocean Territory' },
      { id: 'Brunei Darussalam', text: 'Brunei Darussalam' },
      { id: 'Bulgaria', text: 'Bulgaria' },
      { id: 'Burkina Faso', text: 'Burkina Faso' },
      { id: 'Burundi', text: 'Burundi' },
      { id: 'Cambodia', text: 'Cambodia' },
      { id: 'Cameroon', text: 'Cameroon' },
      { id: 'Canada', text: 'Canada' },
      { id: 'Cape Verde', text: 'Cape Verde' },
      { id: 'Cayman Islands', text: 'Cayman Islands' },
      { id: 'Central African Republic', text: 'Central African Republic' },
      { id: 'Chad', text: 'Chad' },
      { id: 'Chile', text: 'Chile' },
      { id: 'China', text: 'China' },
      { id: 'Christmas Island', text: 'Christmas Island' },
      { id: 'Cocos (Keeling) Islands', text: 'Cocos (Keeling) Islands' },
      { id: 'Colombia', text: 'Colombia' },
      { id: 'Comoros', text: 'Comoros' },
      { id: 'Congo', text: 'Congo' },
      { id: 'Congo}, Democratic Republic', text: 'Congo}, Democratic Republic' },
      { id: 'Cook Islands', text: 'Cook Islands' },
      { id: 'Costa Rica', text: 'Costa Rica' },
      { id: 'Cote D\'Ivoire', text: 'Cote D\'Ivoire' },
      { id: 'Croatia', text: 'Croatia' },
      { id: 'Cuba', text: 'Cuba' },
      { id: 'Cyprus', text: 'Cyprus' },
      { id: 'Czech Republic', text: 'Czech Republic' },
      { id: 'Denmark', text: 'Denmark' },
      { id: 'Djibouti', text: 'Djibouti' },
      { id: 'Dominica', text: 'Dominica' },
      { id: 'Dominican Republic', text: 'Dominican Republic' },
      { id: 'Ecuador', text: 'Ecuador' },
      { id: 'Egypt', text: 'Egypt' },
      { id: 'El Salvador', text: 'El Salvador' },
      { id: 'Equatorial Guinea', text: 'Equatorial Guinea' },
      { id: 'Eritrea', text: 'Eritrea' },
      { id: 'Estonia', text: 'Estonia' },
      { id: 'Ethiopia', text: 'Ethiopia' },
      { id: 'Falkland Islands (Malvinas)', text: 'Falkland Islands (Malvinas)' },
      { id: 'Faroe Islands', text: 'Faroe Islands' },
      { id: 'Fiji', text: 'Fiji' },
      { id: 'Finland', text: 'Finland' },
      { id: 'France', text: 'France' },
      { id: 'French Guiana', text: 'French Guiana' },
      { id: 'French Polynesia', text: 'French Polynesia' },
      { id: 'French Southern Territories', text: 'French Southern Territories' },
      { id: 'Gabon', text: 'Gabon' },
      { id: 'Gambia', text: 'Gambia' },
      { id: 'Georgia', text: 'Georgia' },
      { id: 'Germany', text: 'Germany' },
      { id: 'Ghana', text: 'Ghana' },
      { id: 'Gibraltar', text: 'Gibraltar' },
      { id: 'Greece', text: 'Greece' },
      { id: 'Greenland', text: 'Greenland' },
      { id: 'Grenada', text: 'Grenada' },
      { id: 'Guadeloupe', text: 'Guadeloupe' },
      { id: 'Guam', text: 'Guam' },
      { id: 'Guatemala', text: 'Guatemala' },
      { id: 'Guernsey', text: 'Guernsey' },
      { id: 'Guinea', text: 'Guinea' },
      { id: 'Guinea-Bissau', text: 'Guinea-Bissau' },
      { id: 'Guyana', text: 'Guyana' },
      { id: 'Haiti', text: 'Haiti' },
      { id: 'Heard Island & Mcdonald Islands', text: 'Heard Island & Mcdonald Islands' },
      { id: 'Holy See (Vatican City State)', text: 'Holy See (Vatican City State)' },
      { id: 'Honduras', text: 'Honduras' },
      { id: 'Hong Kong', text: 'Hong Kong' },
      { id: 'Hungary', text: 'Hungary' },
      { id: 'Iceland', text: 'Iceland' },
      { id: 'India', text: 'India' },
      { id: 'Indonesia', text: 'Indonesia' },
      { id: 'Iran, Islamic Republic Of', text: 'Iran, Islamic Republic Of' },
      { id: 'Iraq', text: 'Iraq' },
      { id: 'Ireland', text: 'Ireland' },
      { id: 'Isle Of Man', text: 'Isle Of Man' },
      { id: 'Israel', text: 'Israel' },
      { id: 'Italy', text: 'Italy' },
      { id: 'Jamaica', text: 'Jamaica' },
      { id: 'Japan', text: 'Japan' },
      { id: 'Jersey', text: 'Jersey' },
      { id: 'Jordan', text: 'Jordan' },
      { id: 'Kazakhstan', text: 'Kazakhstan' },
      { id: 'Kenya', text: 'Kenya' },
      { id: 'Kiribati', text: 'Kiribati' },
      { id: 'Korea', text: 'Korea' },
      { id: 'Kuwait', text: 'Kuwait' },
      { id: 'Kyrgyzstan', text: 'Kyrgyzstan' },
      { id: 'Lao People\'s Democratic Republic', text: 'Lao People\'s Democratic Republic' },
      { id: 'Latvia', text: 'Latvia' },
      { id: 'Lebanon', text: 'Lebanon' },
      { id: 'Lesotho', text: 'Lesotho' },
      { id: 'Liberia', text: 'Liberia' },
      { id: 'Libyan Arab Jamahiriya', text: 'Libyan Arab Jamahiriya' },
      { id: 'Liechtenstein', text: 'Liechtenstein' },
      { id: 'Lithuania', text: 'Lithuania' },
      { id: 'Luxembourg', text: 'Luxembourg' },
      { id: 'Macao', text: 'Macao' },
      { id: 'Macedonia', text: 'Macedonia' },
      { id: 'Madagascar', text: 'Madagascar' },
      { id: 'Malawi', text: 'Malawi' },
      { id: 'Malaysia', text: 'Malaysia' },
      { id: 'Maldives', text: 'Maldives' },
      { id: 'Mali', text: 'Mali' },
      { id: 'Malta', text: 'Malta' },
      { id: 'Marshall Islands', text: 'Marshall Islands' },
      { id: 'Martinique', text: 'Martinique' },
      { id: 'Mauritania', text: 'Mauritania' },
      { id: 'Mauritius', text: 'Mauritius' },
      { id: 'Mayotte', text: 'Mayotte' },
      { id: 'Mexico', text: 'Mexico' },
      { id: 'Micronesia, Federated States Of', text: 'Micronesia, Federated States Of' },
      { id: 'Moldova', text: 'Moldova' },
      { id: 'Monaco', text: 'Monaco' },
      { id: 'Mongolia', text: 'Mongolia' },
      { id: 'Montenegro', text: 'Montenegro' },
      { id: 'Montserrat', text: 'Montserrat' },
      { id: 'Morocco', text: 'Morocco' },
      { id: 'Mozambique', text: 'Mozambique' },
      { id: 'Myanmar', text: 'Myanmar' },
      { id: 'Namibia', text: 'Namibia' },
      { id: 'Nauru', text: 'Nauru' },
      { id: 'Nepal', text: 'Nepal' },
      { id: 'Netherlands', text: 'Netherlands' },
      { id: 'Netherlands Antilles', text: 'Netherlands Antilles' },
      { id: 'New Caledonia', text: 'New Caledonia' },
      { id: 'New Zealand', text: 'New Zealand' },
      { id: 'Nicaragua', text: 'Nicaragua' },
      { id: 'Niger', text: 'Niger' },
      { id: 'Nigeria', text: 'Nigeria' },
      { id: 'Niue', text: 'Niue' },
      { id: 'Norfolk Island', text: 'Norfolk Island' },
      { id: 'Northern Mariana Islands', text: 'Northern Mariana Islands' },
      { id: 'Norway', text: 'Norway' },
      { id: 'Oman', text: 'Oman' },
      { id: 'Pakistan', text: 'Pakistan' },
      { id: 'Palau', text: 'Palau' },
      { id: 'Palestinian Territory, Occupied', text: 'Palestinian Territory, Occupied' },
      { id: 'Panama', text: 'Panama' },
      { id: 'Papua New Guinea', text: 'Papua New Guinea' },
      { id: 'Paraguay', text: 'Paraguay' },
      { id: 'Peru', text: 'Peru' },
      { id: 'Philippines', text: 'Philippines' },
      { id: 'Pitcairn', text: 'Pitcairn' },
      { id: 'Poland', text: 'Poland' },
      { id: 'Portugal', text: 'Portugal' },
      { id: 'Puerto Rico', text: 'Puerto Rico' },
      { id: 'Qatar', text: 'Qatar' },
      { id: 'Reunion', text: 'Reunion' },
      { id: 'Romania', text: 'Romania' },
      { id: 'Russian Federation', text: 'Russian Federation' },
      { id: 'Rwanda', text: 'Rwanda' },
      { id: 'Saint Barthelemy', text: 'Saint Barthelemy' },
      { id: 'Saint Helena', text: 'Saint Helena' },
      { id: 'Saint Kitts And Nevis', text: 'Saint Kitts And Nevis' },
      { id: 'Saint Lucia', text: 'Saint Lucia' },
      { id: 'Saint Martin', text: 'Saint Martin' },
      { id: 'Saint Pierre And Miquelon', text: 'Saint Pierre And Miquelon' },
      { id: 'Saint Vincent And Grenadines', text: 'Saint Vincent And Grenadines' },
      { id: 'Samoa', text: 'Samoa' },
      { id: 'San Marino', text: 'San Marino' },
      { id: 'Sao Tome And Principe', text: 'Sao Tome And Principe' },
      { id: 'Saudi Arabia', text: 'Saudi Arabia' },
      { id: 'Senegal', text: 'Senegal' },
      { id: 'Serbia', text: 'Serbia' },
      { id: 'Seychelles', text: 'Seychelles' },
      { id: 'Sierra Leone', text: 'Sierra Leone' },
      { id: 'Singapore', text: 'Singapore' },
      { id: 'Slovakia', text: 'Slovakia' },
      { id: 'Slovenia', text: 'Slovenia' },
      { id: 'Solomon Islands', text: 'Solomon Islands' },
      { id: 'Somalia', text: 'Somalia' },
      { id: 'South Africa', text: 'South Africa' },
      { id: 'South Georgia And Sandwich Isl.', text: 'South Georgia And Sandwich Isl.' },
      { id: 'Spain', text: 'Spain' },
      { id: 'Sri Lanka', text: 'Sri Lanka' },
      { id: 'Sudan', text: 'Sudan' },
      { id: 'Suriname', text: 'Suriname' },
      { id: 'Svalbard And Jan Mayen', text: 'Svalbard And Jan Mayen' },
      { id: 'Swaziland', text: 'Swaziland' },
      { id: 'Sweden', text: 'Sweden' },
      { id: 'Switzerland', text: 'Switzerland' },
      { id: 'Syrian Arab Republic', text: 'Syrian Arab Republic' },
      { id: 'Taiwan', text: 'Taiwan' },
      { id: 'Tajikistan', text: 'Tajikistan' },
      { id: 'Tanzania', text: 'Tanzania' },
      { id: 'Thailand', text: 'Thailand' },
      { id: 'Timor-Leste', text: 'Timor-Leste' },
      { id: 'Togo', text: 'Togo' },
      { id: 'Tokelau', text: 'Tokelau' },
      { id: 'Tonga', text: 'Tonga' },
      { id: 'Trinidad And Tobago', text: 'Trinidad And Tobago' },
      { id: 'Tunisia', text: 'Tunisia' },
      { id: 'Turkey', text: 'Turkey' },
      { id: 'Turkmenistan', text: 'Turkmenistan' },
      { id: 'Turks And Caicos Islands', text: 'Turks And Caicos Islands' },
      { id: 'Tuvalu', text: 'Tuvalu' },
      { id: 'Uganda', text: 'Uganda' },
      { id: 'Ukraine', text: 'Ukraine' },
      { id: 'United Arab Emirates', text: 'United Arab Emirates' },
      { id: 'United Kingdom', text: 'United Kingdom' },
      { id: 'United States', text: 'United States' },
      { id: 'United States Outlying Islands', text: 'United States Outlying Islands' },
      { id: 'Uruguay', text: 'Uruguay' },
      { id: 'Uzbekistan', text: 'Uzbekistan' },
      { id: 'Vanuatu', text: 'Vanuatu' },
      { id: 'Venezuela', text: 'Venezuela' },
      { id: 'Viet Nam', text: 'Viet Nam' },
      { id: 'Virgin Islands}, British', text: 'Virgin Islands}, British' },
      { id: 'Virgin Islands}, U.S.', text: 'Virgin Islands}, U.S.' },
      { id: 'Wallis And Futuna', text: 'Wallis And Futuna' },
      { id: 'Western Sahara', text: 'Western Sahara' },
      { id: 'Yemen', text: 'Yemen' },
      { id: 'Zambia', text: 'Zambia' },
      { id: 'Zimbabwe', text: 'Zimbabwe' }
    ]
  end
  # rubocop:enable MethodLength

  def self.select_options_for_number_of_employees
    ['1-10', '11-50', '51-100', '100-500', '500-1000', '1000-5000', '5000-10 000', '10 000-50 000', '50 000+']
  end

  #------------------------------------------------------------------------------
  # Instance methods
  def active_for_authentication?
    super && active?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  #------------------------------------------------------------------------------
  # Rails Admin Config
  rails_admin do
    object_label_method do
      :full_name
    end

    configure :role, :enum do
      enum do
        Role.select_options
      end
    end

    configure :title, :enum do
      enum do
        Title.select_options
      end
    end

    configure :number_of_employees, :enum do
      enum do
        User.select_options_for_number_of_employees
      end
    end

    configure :country, :enum do
      enum do
        User.country_options.map { |hash| [hash[:id], hash[:text]] }
      end
    end

    list do
      field :id
      field :full_name
      field :role
      field :active
      field :email
      field :title
      field :interests
      field :position
      field :company
      field :telephone
      field :mobile
      field :address
      field :zip_code
      field :city
      field :country
      field :number_of_employees
      field :company_website
      field :reset_password_sent_at
      field :remember_created_at
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :confirmed_at
      field :confirmation_sent_at
      field :unconfirmed_email
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :full_name
      field :role
      field :active
      field :email
      field :title
      field :interests
      field :position
      field :company
      field :telephone
      field :mobile
      field :address
      field :zip_code
      field :city
      field :country
      field :number_of_employees
      field :company_website
      field :reset_password_sent_at
      field :remember_created_at
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :confirmed_at
      field :confirmation_sent_at
      field :unconfirmed_email
      field :created_at
      field :updated_at
    end

    edit do
      field :first_name
      field :last_name
      field :role
      field :active
      field :email
      field :password
      field :password_confirmation
      field :title
      field :interests
      field :position
      field :company
      field :telephone
      field :mobile
      field :address
      field :zip_code
      field :city
      field :country
      field :number_of_employees
      field :company_website
      field :reset_password_sent_at
      field :remember_created_at
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :confirmed_at
      field :confirmation_sent_at
      field :unconfirmed_email
      field :created_at
      field :updated_at
    end

    export do
      field :id
      field :full_name
      field :role
      field :active
      field :email
      field :title
      field :interests
      field :position
      field :company
      field :telephone
      field :mobile
      field :address
      field :zip_code
      field :city
      field :country
      field :number_of_employees
      field :company_website
      field :reset_password_sent_at
      field :remember_created_at
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :confirmed_at
      field :confirmation_sent_at
      field :unconfirmed_email
      field :created_at
      field :updated_at
    end
  end

  #------------------------------------------------------------------------------
  private

  def send_email_to_admin
    ApplicationMailer.sendgrid_send(
      to: 'chantal@baehl-innovation.com',
      template_id: '7ee51e09-8829-495a-a517-6dc3aad1182a',
      substitutions: {
        '-url-': url_helpers.new_admin_session_url,
        '-userRole-': role.to_s.tr('_', ' ').titleize
      }
    ).deliver_now
  end

  def send_email_to_user_on_activation
    if active_changed? && active
      ApplicationMailer.sendgrid_send(
        to: email,
        template_id: '9033cb37-e42e-4a6f-ab63-5120a75c6f08',
        substitutions: {
          '-url-': url_helpers.new_user_session_url
        }
      ).deliver_now
    end
  end

  def send_email_to_user_old_email
    if unconfirmed_email_changed? && !email_changed?
      ApplicationMailer.sendgrid_send(
        to: email,
        template_id: 'c7311ec1-0a66-49c4-9a20-349bd344951a'
      ).deliver_now
    end
  end

  def send_email_to_admin_on_email_change
    if email_changed?
      ApplicationMailer.sendgrid_send(
        to: 'chantal@baehl-innovation.com',
        template_id: '9a57ac9f-657a-45fb-aa2f-68baad888e50',
        substitutions: {
          '-url-': url_helpers.new_admin_session_url
        }
      ).deliver_now
    end
  end
end
