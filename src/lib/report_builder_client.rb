class ReportBuilderClient
  def initialize(subscriber)
    @subscriber = subscriber
  end

  def full_name
    @subscriber.first_name + " " + @subscriber.last_name
  end

  def last_order_amount
    @subscriber.orders.last.total
  end
end