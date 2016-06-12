# frozen_string_literal: true
class UserMailer < Devise::Mailer
  # See: https://github.com/plataformatec/devise/wiki/How-To:-Use-custom-mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      subject: 'Welcome to Baehl Business Hub',
      template_id: '308ce61e-98d8-4edb-9ace-3eb5d5eed32d',
      substitutions: {
        '-url-': confirmation_url(record, confirmation_token: token)
      }
    }

    sendgrid_send options
  end

  def reset_password_instructions(record, token, _opts = {})
    options = {
      to: record.email,
      template_id: '308ce61e-98d8-4edb-9ace-3eb5d5eed32d',
      substitutions: {
        '-url-': edit_user_password_url(record, reset_password_token: token)
      }
    }
    sendgrid_send options
  end
end
