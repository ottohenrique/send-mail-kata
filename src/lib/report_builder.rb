class ReportBuilder
  def initialize(store, template, recipients)
    @store = ReportBuilderStore.new(store)
    @template = template
    @recipients = recipients
  end

  def build
  end
end