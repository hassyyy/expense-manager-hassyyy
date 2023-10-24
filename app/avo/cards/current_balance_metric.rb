class CurrentBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'current_balance_metric'
  self.label = 'Current Balance'
  self.prefix = '₹'

  query do
    income = Expense.where(income: true).sum(:amount)
    expenses = Expense.where(income: false).sum(:amount)

    result number_to_currency(income - expenses, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
