# frozen_string_literal: true
class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  def confirmation_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      template_id: 'bb50b4d5-dcd7-4dde-8364-e1266fcd0f9f',
      substitutions: {
        '-url-': confirmation_url(record, confirmation_token: token)
      }
    }
    sendgrid_send options
  end

  def reset_password_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      template_id: '3f458bad-abaa-4f61-a4c7-1ca3dc0f4fd1',
      substitutions: {
        '-url-': edit_user_password_url(record, reset_password_token: token)
      }
    }
    sendgrid_send options
  end

  def unlock_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      template_id: 'fea1a935-98b9-4f44-81c9-fac1e146a0f5',
      substitutions: {
        '-url-': unlock_url(record, unlock_token: token)
      }
    }
    sendgrid_send options
  end
end
