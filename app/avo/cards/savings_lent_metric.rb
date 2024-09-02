class SavingsLentMetric < Avo::Dashboards::MetricCard
  self.id = 'savings_lent_metric'
  self.label = 'Lent'
  self.prefix = '₹'
  self.cols = 2

  query do
    lent = Saving.where(lent: true).sum(:amount)

    result number_to_currency(lent, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
