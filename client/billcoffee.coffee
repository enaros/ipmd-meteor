Template.bill.helpers
	active: ->
		if Session.get('active') is 'bill' then 'show' else 'hide'

Template.bill.events
	'click .goback': ->
		window.goto "list"
