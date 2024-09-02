class HomeDashboard < Avo::Dashboards::BaseDashboard
  self.id = "home_dashboard"
  self.name = "Home"
  self.grid_cols = 4

  # cards go here
  divider label: "Expenses"
  card CurrentBalanceMetric
  card AccountBalanceMetric
  divider label: "Savings"
  card SavingsTotalBalanceMetric
  card SavingsAccountBalanceMetric
  card SavingsInvestmentMetric
  card SavingsLentMetric
end
