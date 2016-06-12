# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  def test_email(email)
    template_id = '308ce61e-98d8-4edb-9ace-3eb5d5eed32d',
    substitutions = { sub1: 'Testing substitutions in the Sendgrid template engine.' }

    sendgrid_send to: email, subject: 'Test email from Klusster', substitutions: substitutions, template_id: template_id
  end

  # rubocop:disable Metrics/AbcSize, MethodLength
  def sendgrid_send(options = {})
    options.reverse_merge! to: Figaro.env.override_send_to_email,
                           name: '',
                           subject:  %w(development integration).include?(Rails.env) ? "[#{Rails.env}]" : ' ',
                           substitutions: {}
    # Using the SMTP API header to pass client information
    header = Smtpapi::Header.new

    # Specifying the template only if it exists
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

    if Figaro.env.send_email.to_b
      client.send(SendGrid::Mail.new(email_info[:email_parameters])) unless
        # outgoing emails in development, integration environments IFF to devbbq.com domain email addresses
        %w(development integration).include?(Rails.env) && /\w+@devbbq.com/.match(email_info[:email_parameters][:to]).nil?

    end
  end
  # rubocop:enable Metrics/AbcSize
end
