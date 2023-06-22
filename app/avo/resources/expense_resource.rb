class ExpenseResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = true
  self.after_create_path = :index
  self.after_update_path = :index

  if Rails.env.staging?
    self.resolve_query_scope = ->(model_class:) do
      expenses = Expense.all.sort_by { |expense| [Time.parse("#{expense.month} #{expense.year}"), expense.updated_at] }.reverse.pluck(:id)
      Expense.where(:id => expenses).order(Arel.sql("array_position(ARRAY[#{expenses.join(',')}], expenses.id)"))
    end
  end

  field :name, as: :text, link_to_resource: true, required: true
  field :amount, as: :number, required: true
  field :month, as: :select, options: AppOptions::MONTHS.hashify, default: -> { Date.today.strftime("%b") }, only_on: [:forms]
  field :year, as: :number, min: AppOptions::MIN_YEAR, default: -> { Date.today.year }, only_on: [:forms]
  field :month, as: :text do |model, resource, view|
    "#{model.month} #{model.year}"
  end
  field :income, as: :boolean, default: false, hide_on: [:index]

  # filter MonthFilter
  # filter YearFilter
  action Saving
end
