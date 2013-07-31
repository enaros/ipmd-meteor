Template.list.active = -> if Session.get('active') is 'list' then 'show' else ''
Template.list.whoOwesWhom = (o) -> if o.debt >= 0 then 'owes you' else 'you owe'
Template.list.abs = (o) -> Math.abs(o)
Template.list.color = (o) -> if o.debt >= 0 then 'accept' else 'cancel'

Template.list.debts = ->
  user = Meteor.user()
  return [] unless user?.services

  hash = []
  result = []
  
  Debts.find(b: Meteor.userId()).map (obj) -> calculate(hash, obj.a, obj.debt)
  Debts.find(a: Meteor.userId()).map (obj) -> calculate(hash, obj.b, -obj.debt)
  result.push o for k, o of hash
  result

calculate = (hash, who, debt) ->
  if hash[who]
      hash[who].debt += debt
    else
      hash[who] =
        user: Meteor.users.findOne(who)
        debt: debt

Template.list.total = ->
  user = Meteor.userId()
  return [] unless user

  total = 0

  Debts.find({a:Meteor.userId()}).map (doc) -> total -= doc.debt
  Debts.find({b:Meteor.userId()}).map (doc) -> total += doc.debt

  total

Template.list.colortotal = ->
  total = Template.list.total()
  if total > 0 then "green" else "red"

Template.list.preserve ['#list']

# Template.list.rendered = ->
#   console.log 'list-rendered', this
  # $("#list").addClass "show" unless $('section.show').length
  # Lungo.Boot.Data.init('#list')


Template.list.events
  'click #list li': (evt, tmplt) ->
    console.log 'clicked'
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

	'click #list li': (evt, tmplt) ->
		Session.set 'people', @.a
