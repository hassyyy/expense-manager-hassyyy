class SavingsTotalBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'savings_total_balance_metric'
  self.label = 'Total Balance'
  self.prefix = '₹'
  self.cols = 2

  query do
    income = Saving.where(income: true).sum(:amount)
    expenses = Saving.where(income: false).sum(:amount)
    investment = Saving.where(investment: true).sum(:amount)
    lent = Saving.where(lent: true).sum(:amount)
    total = income - expenses + investment + lent

    result number_to_currency(total, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
