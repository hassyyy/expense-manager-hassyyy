class FuelExpenses < Avo::Dashboards::PartialCard
  self.id = "fuel_expenses"
  self.partial = "avo/cards/fuel_expenses"
  self.display_header = false
  self.rows = 12
  self.cols = 6
end
