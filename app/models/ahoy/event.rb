# frozen_string_literal: true
# == Schema Information
#
# Table name: ahoy_events
#
#  id         :integer          not null, primary key
#  visit_id   :integer
#  user_id    :integer
#  name       :string(255)
#  properties :text(65535)
#  time       :datetime
#
# Indexes
#
#  index_ahoy_events_on_name_and_time      (name,time)
#  index_ahoy_events_on_user_id_and_name   (user_id,name)
#  index_ahoy_events_on_visit_id_and_name  (visit_id,name)
#

module Ahoy
  class Event < ActiveRecord::Base
    self.table_name = 'ahoy_events'

    belongs_to :visit
    belongs_to :user

    serialize :properties, JSON
  end
end
