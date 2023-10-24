include ActionView::Helpers::NumberHelper

class AccountBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'account_balance_metric'
  self.label = 'Account Balance'
  self.prefix = '₹'

  query do
    balance = Balance.sum(:amount)
    credit_card_balances = CreditCard.sum do |card|
      card.transactions.where(month: card.current_month.strftime("%b"), year: card.current_month.year).sum(:amount)
    end

    result number_to_currency(balance - credit_card_balances, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
