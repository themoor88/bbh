# frozen_string_literal: true
# == Schema Information
#
# Table name: proposed_solutions
#
#  id                        :integer          not null, primary key
#  user_id                   :integer
#  campaign_id               :integer
#  link                      :string(255)
#  technology_description    :text(65535)
#  technology_application    :text(65535)
#  patents                   :text(65535)
#  trl                       :string(255)
#  licence_available         :string(255)
#  institution               :string(255)
#  expectations              :text(65535)
#  percent_match             :integer
#  reviewed                  :boolean
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  attachment_1_file_name    :string(255)
#  attachment_1_content_type :string(255)
#  attachment_1_file_size    :integer
#  attachment_1_updated_at   :datetime
#  attachment_2_file_name    :string(255)
#  attachment_2_content_type :string(255)
#  attachment_2_file_size    :integer
#  attachment_2_updated_at   :datetime
#  attachment_3_file_name    :string(255)
#  attachment_3_content_type :string(255)
#  attachment_3_file_size    :integer
#  attachment_3_updated_at   :datetime
#
# Indexes
#
#  index_proposed_solutions_on_campaign_id  (campaign_id)
#  index_proposed_solutions_on_user_id      (user_id)
#

class ProposedSolution < ActiveRecord::Base
  delegate :url_helpers, to: 'Rails.application.routes'

  #------------------------------------------------------------------------------
  # Associations
  belongs_to :user
  belongs_to :campaign
  has_attached_file :attachment_1
  has_attached_file :attachment_2
  has_attached_file :attachment_3

  #------------------------------------------------------------------------------
  # Scopes
  scope :reviewed, -> { where(reviewed: true) }

  #------------------------------------------------------------------------------
  # Validations
  validates_attachment :attachment_1, content_type: { content_type: %w(image/jpeg image/png application/pdf application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
                                      message: 'File must be .pdf, .doc, .docx, .ppt, .pptx, .jpg, .png, .xls, .xlsx'
  validates_attachment :attachment_2, content_type: { content_type: %w(image/jpeg image/png application/pdf application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
                                      message: 'File must be .pdf, .doc, .docx, .ppt, .pptx, .jpg, .png, .xls, .xlsx'
  validates_attachment :attachment_3, content_type: { content_type: %w(image/jpeg image/png application/pdf application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
                                      message: 'File must be .pdf, .doc, .docx, .ppt, .pptx, .jpg, .png, .xls, .xlsx'

  validates :user_id, :campaign_id, :technology_description, :technology_application, :trl, presence: true

  #------------------------------------------------------------------------------
  # Callbacks
  after_create :send_email_to_admin

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
  rails_admin do
    list do
      field :id
      field :reviewed
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :link
      field :attachment_1
      field :attachment_2
      field :attachment_3
      field :technology_description
      field :technology_application
      field :patents
      field :trl, :enum do
        enum do
          ProposedSolution.trl_options
        end
      end
      field :licence_available
      field :institution
      field :expectations
      field :percent_match
      field :created_at
    end

    show do
      field :id
      field :reviewed
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :link
      field :attachment_1
      field :attachment_2
      field :attachment_3
      field :technology_description
      field :technology_application
      field :patents
      field :trl, :enum do
        enum do
          ProposedSolution.trl_options
        end
      end
      field :licence_available
      field :institution
      field :expectations
      field :percent_match
      field :created_at
    end

    edit do
      field :reviewed
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :link
      field :attachment_1
      field :attachment_2
      field :attachment_3
      field :technology_description
      field :technology_application
      field :patents
      field :trl, :enum do
        enum do
          ProposedSolution.trl_options
        end
      end
      field :licence_available
      field :institution
      field :expectations
      field :percent_match
    end

    export do
      field :id
      field :reviewed
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :link
      field :attachment_1
      field :attachment_2
      field :attachment_3
      field :technology_description
      field :technology_application
      field :patents
      field :trl, :enum do
        enum do
          ProposedSolution.trl_options
        end
      end
      field :licence_available
      field :institution
      field :expectations
      field :percent_match
      field :created_at
    end
  end

  #------------------------------------------------------------------------------
  private

  def send_email_to_admin
    ApplicationMailer.sendgrid_send(
      to: 'chantal@baehl-innovation.com',
      template_id: '850a599b-da08-4c68-82c3-60b1d2ed2ed0',
      substitutions: {
        '-firstName-': user.first_name,
        '-lastName-': user.last_name,
        '-link-': link.present? ? "Here is the link associated with the proposed solution: #{link}" : ' ',
        '-attachment1-': attachment_1.present? ? "Here is an attachment associated with the proposed solution: #{attachment_1}" : ' ',
        '-attachment2-': attachment_2.present? ? "Here is an attachment associated with the proposed solution: #{attachment_2}" : ' ',
        '-attachment3-': attachment_3.present? ? "Here is an attachment associated with the proposed solution: #{attachment_3}" : ' ',
        '-url-': url_helpers.new_admin_session_url
      }
    ).deliver_now
  end
end
