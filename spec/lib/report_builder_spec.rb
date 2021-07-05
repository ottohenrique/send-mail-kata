require 'spec_helper'
require 'ostruct'

require_relative './../../src/lib/report_builder.rb'

describe ReportBuilder do
  let(:subscribers) { [OpenStruct.new(first_name: "John", last_name: "Doe", orders: [])]}
  let(:template) { TemplateParser.new("{{ subscriber_full_name }} {{ last_order_amount }}")}
  let(:store) { OpenStruct.new(name: "A Big Store", subscribers: subscribers) }

  let(:recipients) { ["johndoe@example.com"]  }

  subject { ReportBuilderStore.new(store, template, recipients) }

  context "#build" do
    it { fail }
  end
end