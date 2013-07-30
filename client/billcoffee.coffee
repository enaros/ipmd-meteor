Template.bill.helpers
	active: ->
		if Session.get('active') is 'bill' then 'show' else 'hide'
	
	user: ->
		Session.get 'bill-user'

Template.bill.events
	'click .goback': ->
		window.goto "list"

	'click #fb-friend': ->
		Session.set 'facebook-bill', true
		window.goto "facebook"


