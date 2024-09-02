class SavingsFilter < Avo::Filters::BooleanFilter
  self.name = 'Savings'

  def apply(request, query, values)
    if values['is_invested']
      query = query.where(invested: true)
    end
    
    if values['is_lent']
      query = query.where(lent: true)
    end

    query
  end

  def options
    {
      is_invested: "Invested",
      is_lent: "Lent",
    }
  end

  def default
    {
      is_invested: false,
      is_lent: false
    }
  end
end
