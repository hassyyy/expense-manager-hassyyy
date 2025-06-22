class CreateDefaultExpenses < Avo::BaseAction
  self.name = "Create Default Expenses"
  self.standalone = true

  DEFAULT_EXPENSES = {
    'Salary': {
      amount: 40000,
      income: true
    },
    'Car - Pooling': {
      amount: 0,
      income: false
    },
    'Groceries': {
      amount: 0,
      income: false
    },
    'Snacks': {
      amount: 0,
      income: false
    },
    'Petrol - Car': {
      amount: 0,
      income: false
    },
    'Heroku & AWS': {
      amount: 820,
      income: false
    },
    'Apple Storage': {
      amount: 75,
      income: false
    }
  }

  def handle(**args)
    fields, current_user, resource = args.values_at(:fields, :current_user, :resource)

    month = Date.today.strftime("%b")
    year = Date.today.year

    DEFAULT_EXPENSES.each do |name, values|
      Expense.create(
        name: name,
        amount: values[:amount],
        income: values[:income],
        month: month,
        year: year
      )
    end

    Saving.create(
      name: "Salary",
      amount: 100000,
      income: true,
      month: month,
      year: year
    )

    sbi_saving = Saving.find(243)
    sbi_saving.amount += 50000
    sbi_saving.save

    succeed 'Default expenses created successfully'
  end
end
