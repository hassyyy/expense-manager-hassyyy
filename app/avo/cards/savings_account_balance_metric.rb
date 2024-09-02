class SavingsAccountBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'savings_account_balance_metric'
  self.label = 'Account Balance'
  self.prefix = '₹'
  self.cols = 2

  query do
    income = Saving.where(income: true).sum(:amount)
    expenses = Saving.where(income: false).sum(:amount)

    result number_to_currency(income - expenses, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
