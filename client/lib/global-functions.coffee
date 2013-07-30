window.goto = (donde) ->
	Session.set 'active', donde

window.stats = (query) ->
  tags = {}
  debts = Debts.find({}).map (debt) ->
    for key, tag of debt.tags
      if tag of tags
        tags[tag] += 1
      else
        tags[tag] = 1
  tags