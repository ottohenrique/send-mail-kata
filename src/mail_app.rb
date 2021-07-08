require_relative './lib/template_parser.rb'
require_relative './lib/report_builder.rb'

class MailApp
  def self.send_mail(campaign, recipients_list)
    template = TemplateParser.new(campaign.html)
    report = ReportBuilder.new(campaign.store, template, recipients_list)

    {
      sender: 'from@example.com',
      html: campaign.html,
      recipient_variables: {
        'johndoe@example.com' => {},
        'marluce@example.com' => {}
      }
    }
  end
end