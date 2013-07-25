user = Meteor.users.findOne({_id:Meteor.userId()})

console.log 'user ->', user

Template.list.debtors = ->
	user = Meteor.users.findOne({_id:Meteor.userId()})
	return [] unless user
	window.Debts.find({b:user.username})

Template.list.creditors = ->
	user = Meteor.users.findOne({_id:Meteor.userId()})
	return [] unless user
	window.Debts.find({a:user.username})

Template.list.total = ->
	user = Meteor.users.findOne({_id:Meteor.userId()})
	return [] unless user

	total = 0

	window.Debts.find({a:user.username}).map (doc) -> total -= doc.debt
	window.Debts.find({b:user.username}).map (doc) -> total += doc.debt

	total

Template.list.colortotal = ->
	total = Template.list.total()
	if total > 0 then "green" else "red"

# Template.list.preserve ['header']

Template.list.rendered = ->
	console.log 'list-rendered', this
	$("#list").addClass "show" unless $('section.show').length
	# Lungo.Boot.Data.init('#list')

Template.list.events
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