require 'spec_helper'
require 'ostruct'

require_relative './../../src/lib/report_builder_client.rb'

describe ReportBuilderClient do
  let(:order1) do
    OpenStruct.new(
      id: 1,
      total: 10.0,
      line_items: [
        OpenStruct.new(
          quantity: 1,
          price: 10.0,
          product: OpenStruct.new(name: 'a-product-1')
        )
      ]
    )
  end

  let(:order2) do
    OpenStruct.new(
      id: 2,
      total: 20.0,
      line_items: [
        OpenStruct.new(
          quantity: 2,
          price: 10.0,
          product: OpenStruct.new(name: 'a-product-1')
        )
      ]
    )
  end

  let(:order3) do
    OpenStruct.new(
      id: 3,
      total: 30.0,
      line_items: [
        OpenStruct.new(
          quantity: 2,
          price: 10.0,
          product: OpenStruct.new(name: 'a-product-1')
        ),
        OpenStruct.new(
          quantity: 1,
          price: 10.0,
          product: OpenStruct.new(name: 'a-product-2')
        )
      ]
    )
  end

  
  let(:orders) { [order1, order2, order3] }
  let(:client) { OpenStruct.new(first_name: "John", last_name: "Doe", orders: orders) }

  subject { ReportBuilderClient.new(client) }

  context "#full_name" do
    it { expect(subject.full_name).to eq("John Doe") }
  end

  context "#last_order_amount" do
    it { expect(subject.last_order_amount).to eq(30.0) }
  end
end