window.goto = (donde) ->
	Session.set 'active', donde

window.init_stats = () ->
  Stats.insert( 'user': 'luchux',
                'debt_tags': [{'beer':10, 'trolas':2}],
                'cred_tags': [{'food':5, 'sports':20}],
                'debt_users': ['enaros':200, 'david':100],
                'cred_users': ['enaros':50],
                })

window.stats = (query) ->
  tags = {}
  debts = Debts.find({}).map (debt) ->
    for key, tag of debt.tags
      if tag of tags
        tags[tag] += 1
      else
        tags[tag] = 1
  tags