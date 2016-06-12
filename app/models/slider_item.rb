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
  has_attached_file :slide_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # Scopes
  scope :active, -> { where(active: true) }

  #------------------------------------------------------------------------------
  # Validations
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :slide_image, content_type: %r{/\Aimage\/.*\Z/}

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
      field :slide_image
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
