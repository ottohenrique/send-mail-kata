require_relative './report_builder_client.rb'

class ReportBuilderStore
  def initialize(store)
    @store = store

    if @store.subscribers.nil?
      @subscribers = []
    else
      @subscribers = store.subscribers.map { |client| ReportBuilderClient.new(client) }
    end
  end

  def store_name
    @store.name
  end 

  def subscribers
    @subscribers
  end
end