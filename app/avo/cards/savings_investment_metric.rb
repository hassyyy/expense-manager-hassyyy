class SavingsInvestmentMetric < Avo::Dashboards::MetricCard
  self.id = 'savings_investment_metric'
  self.label = 'Investment'
  self.prefix = '₹'
  self.cols = 2

  query do
    investment = Saving.where(investment: true).sum(:amount)

    result number_to_currency(investment, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
