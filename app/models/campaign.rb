# frozen_string_literal: true
# == Schema Information
#
# Table name: campaigns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  state       :string(255)
#  expires_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# frozen_string_literal: true
class Campaign < ActiveRecord::Base
end
