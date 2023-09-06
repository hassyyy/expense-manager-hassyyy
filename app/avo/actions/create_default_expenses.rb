class CreateDefaultExpenses < Avo::BaseAction
  self.name = "Create Default Expenses"
  self.standalone = true

  DEFAULT_EXPENSES = {
    'Salary': {
      amount: 30000,
      income: true
    },
    'Car - Pooling': {
      amount: 0,
      income: true
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
    'Office - Food Court': {
      amount: 0,
      income: false
    },
    'Netflix': {
      amount: 500,
      income: false
    },
    'Heroku': {
      amount: 400,
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

    succeed 'Default expenses created successfully'
  end
end
