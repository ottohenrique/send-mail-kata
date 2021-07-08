require_relative './lib/template_parser.rb'
require_relative './lib/report_builder.rb'

class MailApp
  def self.send_mail(campaign, recipients_list)
    template = TemplateParser.new(campaign.html)
    report_store = ReportBuilderStore.new(campaign.store)
    report = ReportBuilder.new(report_store, template, recipients_list)

    {
      sender: 'from@example.com',
      html: campaign.html,
      recipient_variables: report.subscriber_params
    }
  end
end