# frozen_string_literal: true
# == Schema Information
#
# Table name: slider_items
#
#  id                       :integer          not null, primary key
#  title                    :string(255)
#  link                     :string(255)
#  active                   :boolean
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  slide_image_file_name    :string(255)
#  slide_image_content_type :string(255)
#  slide_image_file_size    :integer
#  slide_image_updated_at   :datetime
#

class SliderItem < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Associations
  has_attached_file :slide_image, styles: { medium: '950x400#' }

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # Scopes
  scope :active, -> { where(active: true) }

  #------------------------------------------------------------------------------
  # Validations
  validates_attachment_content_type :slide_image, content_type: /^image\/(jpg|jpeg|png)$/
  validates :slide_image, attachment_presence: true

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
      field :title
      field :link
      field :slide_image
      field :active
      field :created_at
    end

    show do
      field :id
      field :title
      field :link
      field :slide_image
      field :active
      field :created_at
    end

    edit do
      field :title
      field :link
      field :slide_image do
        help 'Please ensure the photo is rectangular (eg. 950px X 400px).'
      end
      field :active
    end

    export do
      field :id
      field :title
      field :link
      field :slide_image
      field :active
      field :created_at
    end
  end

  #------------------------------------------------------------------------------
  # private
end
