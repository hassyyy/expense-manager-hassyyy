class CreditCard < ApplicationRecord
  has_many :transactions
  has_many :loans
  default_scope { order(created_at: :asc) }
  before_destroy :stop_destroy_if_any_associations

  def stop_destroy_if_any_associations
    return if transactions.none? && loans.none?
    raise ActiveRecord::RecordNotDestroyed, 'Cannot delete due to existing transactions or loans'
  end

  def current_month
    (Date.today.day <= billing_day) ? Date.today : Date.today.next_month
  end

  def previous_month
    (Date.today.day <= billing_day) ? Date.today.last_month : Date.today
  end
end
