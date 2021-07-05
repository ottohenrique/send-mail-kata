require 'spec_helper'
require 'ostruct'

require_relative './../../src/lib/report_builder_store.rb'

describe ReportBuilderStore do
  let(:subscribers) { [OpenStruct.new(first_name: "John", last_name: "Doe", orders: [])]}
  let(:store) { OpenStruct.new(name: "A Big Store", subscribers: subscribers) }

  subject { ReportBuilderStore.new(store) }

  context "#store_name" do
    it { expect(subject.store_name).to eq "A Big Store" }
  end

  context "#subscribers" do
    it { expect(subject.subscribers).not_to be_empty }
  end
end