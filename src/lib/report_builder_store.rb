require_relative './report_builder_client.rb'

class ReportBuilderStore
  def initialize(store)
    @store = store
    @subscribers = nil
  end

  def store_name
    @store.name
  end 

  def subscribers
    @subscribers ||= @store.subscribers.map do |client|
      ReportBuilderClient.new(client)
    end
  end
end