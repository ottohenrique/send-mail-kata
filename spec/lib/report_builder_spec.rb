require 'spec_helper'
require 'ostruct'

require_relative './../../src/lib/report_builder.rb'

describe ReportBuilder do
  let(:template) { TemplateParser.new("{{ subscriber_full_name }} {{ last_order_amount }}")}

  let(:recipients) { ["johndoe@example.com"] }

  let(:subscriber1) { instance_double('ReportBuilderClient', {
    full_name: 'John Doe',
    email: 'johndoe@example.com',
    last_order_amount: 10.0
  }) }

  let(:subscriber2) { instance_double('ReportBuilderClient', {
    full_name: '',
    email: 'marluce@example.com',
    last_order_amount: nil
  }) }

  let(:store) { instance_double('ReportBuilderStore', store_name: 'A Big Store', subscribers: [subscriber1, subscriber2] ) }

  subject { ReportBuilder.new(store, template, recipients) }

  describe "#store_params" do
    it { expect(subject.store_params).to eq({ 'name' => 'A Big Store' }) }
  end

  describe "#subscriber_params" do
    it { expect(subject.subscriber_params['johndoe@example.com']).to eq({
      'subscriber_full_name' => 'John Doe',
      'last_order_amount' => 10.0,
      }) }

      it { expect(subject.subscriber_params['marluce@example.com']).to eq({
        'subscriber_full_name' => '',
        'last_order_amount' => '',
        }) }
  end
end