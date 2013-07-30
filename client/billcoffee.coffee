Template.bill.helpers
	active: ->
		if Session.get('active') is 'bill' then 'show' else 'hide'
	
	user: ->
		Session.get 'bill-user'

Template.bill.events
	'touch .goback': ->
		window.goto "list"

	'touch #fb-friend': ->
		Session.set 'facebook-bill', true
		window.goto "facebook"

	'touch [type=checkbox]': ->
		$("#bill fieldset span").toggle()


