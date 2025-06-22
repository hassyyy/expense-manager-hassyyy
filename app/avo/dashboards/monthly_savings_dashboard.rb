class MonthlySavingsDashboard < Avo::Dashboards::BaseDashboard
  self.id = "monthly_savings_dashboard"
  self.name = "Monthly Savings"

  # cards go here
  card MonthlySavings
end
