require 'spec_helper'
require 'ostruct'

require_relative './../src/mail_app.rb'

describe MailApp do
  
  context '#send_mail' do
    let(:html_template) do
      <<~TEMPLATE
      <html>
        <body>
          <p> Hello {{ subscriber_full_name | fallback: 'there' }}!
            You spent {{ last_order_amount | fallback: '0' }} USD in your last order. </p>
            
          <p> Sent with love from {{ store_name }} </p>
        </body>
      </html>
      TEMPLATE
    end

    let(:subscribers) { [OpenStruct.new(first_name: "John", last_name: "Doe", orders: [])]}
    let(:store) { OpenStruct.new(name: "A Big Store", subscribers: subscribers) }
    let(:campaing) { OpenStruct.new(html: html_template, store: store) }
    let(:recipients) { ['johndoe@example.com', 'marluce@example.com'] }

    subject { MailApp.send_mail(campaing, recipients) }

    it 'returns a mail object with correct recipients' do
      expect(subject).to have_key(:recipient_variables)
      expect(subject[:recipient_variables].keys).to eq(recipients)
    end

    it 'returns a mail object with correct template' do
      expect(subject[:html]).to eq(campaing.html)
    end

    it 'returns a mail object with correct sender' do
      expect(subject[:sender]).to eq('from@example.com')
    end
  end
end