class FuelExpensesDashboard < Avo::Dashboards::BaseDashboard
  self.id = "fuel_expenses_dashboard"
  self.name = "Fuel Expenses"

  # cards go here
  card FuelExpenses
end
