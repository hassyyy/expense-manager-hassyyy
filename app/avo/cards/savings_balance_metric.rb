class SavingsBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'savings_balance_metric'
  self.label = 'Savings Balance'
  # self.cols = 1
  # self.rows = 1
  # self.initial_range = 30
  # self.ranges = [7, 30, 60, 365, 'TODAY', 'MTD', 'QTD', 'YTD', 'ALL']
  # self.prefix = '$'
  # self.suffix = '%'
  # self.refresh_every = 10.minutes

  query do
    income = Saving.where(income: true).sum(:amount)
    expenses = Saving.where(income: false).sum(:amount)

    result number_to_currency(income - expenses, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
