window.add_debt = (debt) ->
  console.log debt

  Stats.update( user: debt.a,
                $push:
                  'debt_tags': debt.tags
                $inc:
                  'total': 1
                upsert: true
              )

###
  #Stats.insert({'hola'})
  Stats.update({ 'user' : "luchux" },
          { $inc : { uniques:0, pageviews: 1} },
          { upsert : true })
###
