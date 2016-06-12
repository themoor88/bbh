# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  # rubocop:disable Metrics/AbcSize
  def sendgrid_send(options = {})
    options.reverse_merge! to: Figaro.env.override_send_to_email,
                           name: ' ',
                           subject: ' ',
                           substitutions: {}

    # Using the SMTP API header to pass client information
    header = Smtpapi::Header.new

    header.add_filter('templates', 'enable', 1) # necessary for each time the template engine is used

    email_info = {
      email_parameters: {
        to: options[:to],
        to_name: options[:name],
        subject: options[:subject],
        text: ' ',
        html: ' ',
        from: Figaro.env.sendgrid_from_email,
        from_name: Figaro.env.sendgrid_from_name,
        smtpapi: header
      },
      substitutions: options[:substitutions],
      template_id: options[:template_id]
    }

    header.add_filter('templates', 'template_id', email_info[:template_id])

    # Adding substitution tags for the template
    email_info[:substitutions].each { |sub| header.add_substitution(sub[0], [sub[1]]) }

    # Send the email
    client = SendGrid::Client.new(api_key: Figaro.env.sendgrid_api_key)

    # Always use the override_send_to_email if it exists
    email_info[:email_parameters][:to] = Figaro.env.override_send_to_email if Figaro.env.override_send_to_email.present?

    client.send(SendGrid::Mail.new(email_info[:email_parameters]))
  end
  # rubocop:enable Metrics/AbcSize
end
