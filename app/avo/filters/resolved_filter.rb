class ResolvedFilter < Avo::Filters::SelectFilter
  self.name = 'Resolved'

  def apply(request, query, values)
    return query if values['is_resolved'] && values['is_unresolved']

    if values['is_resolved']
      query = query.where(resolved: true)
    elsif values['is_unresolved']
      query = query.where(resolved: [nil, false])
    end

    query
  end

  def options
    {
      is_resolved: "Resolved",
      is_unresolved: "Unresolved"
    }
  end

  def default
    {
      is_unresolved: true
    }
  end
end
