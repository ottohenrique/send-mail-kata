require 'spec_helper'
require 'ostruct'

require_relative './../src/mail_app.rb'

describe MailApp do
  
  context '#send_mail' do    
    let(:campaing) { OpenStruct.new(html: "a html template", store: {}) }
    let(:recipients) { ['johndoe@example.com', 'marluce@example.com'] }

    subject { MailApp.send_mail(campaing, recipients) }

    it 'returns a mail object with correct params' do
      allow_any_instance_of(ReportBuilder).to receive(:subscriber_params).and_return({
        'johndoe@example.com' => {
        'subscriber_full_name' => 'John Doe',
        'last_order_amount' => '30.00',
        'store_name' => 'A Big Store'
        }, 'marluce@example.com' => {
          'subscriber_full_name' => '',
          'last_order_amount' => '',
          'store_name' => 'A Big Store'
        }
      })

      expect(subject).to have_key(:recipient_variables)
      expect(subject[:recipient_variables].keys).to eq(recipients)
      expect(subject[:recipient_variables]['johndoe@example.com']).to eq(
        {
          'subscriber_full_name' => 'John Doe',
          'last_order_amount' => '30.00',
          'store_name' => 'A Big Store'
        }
      )

      expect(subject[:html]).to eq(campaing.html)
      expect(subject[:sender]).to eq('from@example.com')
    end
  end
end