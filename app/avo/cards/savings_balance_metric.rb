class SavingsBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'savings_balance_metric'
  self.label = 'Savings Balance'
  self.prefix = '₹'

  query do
    income = Saving.where(income: true).sum(:amount)
    expenses = Saving.where(income: false).sum(:amount)

    result number_to_currency(income - expenses, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
