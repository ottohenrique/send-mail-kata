class MailApp
  def self.send_mail(campaing, recipients_list)
    recipients = recipients_list.reduce({}) do |list, recipient|
      list[recipient] = {}
      list
    end

    {recipient_variables: recipients, html: campaing.html, sender: 'from@example.com'}
  end
end