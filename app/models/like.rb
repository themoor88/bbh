# frozen_string_literal: true
# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  campaign_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_likes_on_campaign_id  (campaign_id)
#  index_likes_on_user_id      (user_id)
#

class Like < ActiveRecord::Base
  #------------------------------------------------------------------------------
  # Associations
  belongs_to :user
  belongs_to :campaign

  #------------------------------------------------------------------------------
  # Enumerations

  #------------------------------------------------------------------------------
  # Scopes

  #------------------------------------------------------------------------------
  # Validations
  validates :user_id, :campaign_id, presence: true

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
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :created_at
    end

    show do
      field :id
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :created_at
    end

    edit do
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :created_at
    end

    export do
      field :id
      field :user do
        label 'Name'
      end
      field :campaign do
        label 'Title'
      end
      field :created_at
    end
  end

  #------------------------------------------------------------------------------
  # private
end
