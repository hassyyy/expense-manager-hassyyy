class MonthlySavings < Avo::Dashboards::PartialCard
  self.id = "monthly_savings"
  self.partial = "avo/cards/monthly_savings"
  self.display_header = false
  self.rows = 12
  self.cols = 6
end
