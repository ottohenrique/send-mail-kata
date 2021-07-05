require_relative './lib/template_parser.rb'
require_relative './lib/report_builder.rb'

class MailApp
  def self.send_mail(campaing, recipients_list)
    template = TemplateParser.new(campaing.html)
    report = ReportBuilder.new(campaign.store, template, recipients_list)

    {
      sender: 'from@example.com',
      html: campaing.html,
      recipient_variables: report.build
    }
  end
end