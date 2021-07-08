class ReportBuilder
  def initialize(report_store, template, recipients)
    @report_store = report_store
    @template = template
    @recipients = recipients
  end

  def store_params
    { 'name' => @report_store.store_name }
  end

  def subscriber_params
    @report_store.subscribers.reduce({}) do |acc, subscriber|
      sub_params = {}
      @template.variables.each do |var, fallback|
        value = case var
          when 'subscriber_full_name'
            subscriber.full_name
          when 'email'
            subscriber.email
          when 'last_order_amount'
            subscriber.last_order_amount
          when 'store'
            @report_store.store_name
          end
        
        sub_params[var] = value || fallback || ''
      end

      acc[subscriber.email] = sub_params
      acc
    end
  end
end