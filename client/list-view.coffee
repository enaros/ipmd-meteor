Template.list.active = ->
	if Session.get('active') is 'list' then 'show' else ''

Template.list.debtors = ->
  user = Meteor.users.findOne({ _id: Meteor.userId() })
  return [] unless user

  dict = {}

  Debts.find({ b:user.username }).map (debt)->
    if debt.a of dict
      dict[debt.a].debt += debt.debt
      if dict[debt.a].date < debt.date
        dict[debt.a].date = debt.date
    else
      dict[debt.a] = { 'a': debt.a, 'debt': debt.debt, 'tags': {}, 'date': debt.date }

    for tag of debt.tags
      if (!( tag of dict[debt.a].tags))
        dict[debt.a].tags[tag] = true

  console.log 'debitors ->', dict

  list = Array()
  for k,v of dict
    list.push v

  console.log 'lista', list
  list

Template.list.creditors = ->
  user = Meteor.users.findOne({_id:Meteor.userId()})
  return [] unless user

  user = Meteor.users.findOne({ _id: Meteor.userId() })

  dict = {}

  Debts.find({ a:user.username }).map (debt)->
    if debt.b of dict
      console.log "ya existe"
      dict[debt.b].debt += debt.debt
      if dict[debt.b].date < debt.date
        dict[debt.b].date = debt.date
    else
      dict[debt.b] = { 'b': debt.b, 'debt': debt.debt, 'tags': {}, 'date': debt.date }

    for tag, val of debt.tags
      if (!( tag of dict[debt.b].tags))
        dict[debt.b].tags[tag] = true

  console.log 'creditors ->', dict

  list = Array()
  for k,v of dict
    list.push v

  console.log 'lista', list
  list

Template.list.total = ->
  user = Meteor.users.findOne({_id:Meteor.userId()})
  return [] unless user

  total = 0

  Debts.find({a:user.username}).map (doc) -> total -= doc.debt
  Debts.find({b:user.username}).map (doc) -> total += doc.debt

  total

Template.list.colortotal = ->
  total = Template.list.total()
  if total > 0 then "green" else "red"

Template.list.preserve ['#list']

Template.list.rendered = ->
  console.log 'list-rendered', this
  # $("#list").addClass "show" unless $('section.show').length
  # Lungo.Boot.Data.init('#list')


Template.list.events
  'click #list li': (evt, tmplt) ->
    console.log 'clicked'
    #TODO: when I owe, owes menu in template, check
    #this because @.a can be myself depending which list i am looking.
    Session.set 'people', @.a
    Session.set 'active', 'people'

	'touch .menu': ->
		console.log 'culo'

	'touch section#list a[data-icon=plus]': ->
		console.log "meteor + preesed in list", @
		Lungo.Notification.confirm({
			icon: 'user'
			title: 'New One'
			description: 'Hallo poolly'
			accept:
				icon: 'checkmark'
				label: 'Accept'
				callback: (e) -> console.log "yes!"
			cancel:
				icon: 'close'
				label: 'Cancel'
				callback: (e) -> console.log "no!"
		})



