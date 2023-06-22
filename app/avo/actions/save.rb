class Save < Avo::BaseAction
  self.name = 'Save'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.each do |model|
      saving = Saving.new
      saving.name = model.name
      saving.amount = model.amount
      saving.month = Date.today.strftime("%b")
      saving.year = Date.today.year
      saving.save

      if model.is_a? Expense
        model.destroy
      elsif model.is_a? Transaction
        model.update(resolved: true)
      end
    end
  end
end
