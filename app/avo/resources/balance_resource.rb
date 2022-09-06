class BalanceResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :name, as: :text, link_to_resource: true, required: true
  field :amount, as: :number, required: true
  field :updated_at, as: :date_time, format: '%B %d, %Y', hide_on: [:forms]
end
