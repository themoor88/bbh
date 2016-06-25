# frozen_string_literal: true
class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  def confirmation_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      template_id: '97083f46-fb36-4554-9d29-ab4330d9b932',
      substitutions: {
        '-url-': confirmation_url(record, confirmation_token: token)
      }
    }
    sendgrid_send options
  end

  def reset_password_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      template_id: '08ff17c2-9d17-4974-a772-565f96e2391a',
      substitutions: {
        '-url-': edit_user_password_url(record, reset_password_token: token)
      }
    }
    sendgrid_send options
  end
end
