Template.bill.helpers
	active: ->
		if Session.get('active') is 'bill' then 'show' else 'hide'
	
	user: ->
		Session.get 'bill-user'

Template.bill.events
	'touch .goback': ->
		window.goto "list"

	'touch .ok-sign': ->
		selectedUser = Session.get 'bill-user'
		return unless selectedUser

		dbuser = Meteor.users.findOne 'services.facebook.id': selectedUser.id
		Meteor.call('createFacebookUser', selectedUser) unless dbuser

		debtor = if $('[type=checkbox]').is(':checked') then Meteor.user().services.facebook.id else selectedUser.id
		creditor = if $('[type=checkbox]').is(':checked') then selectedUser.id else Meteor.user().services.facebook.id
		
		Meteor.call 'addDebt', debtor, creditor, 50, 'hola', (error, result) =>
			console.log error, result

	'touch #fb-friend': ->
		Session.set 'facebook-bill', true
		window.goto "facebook"

	'touch [type=checkbox]': ->
		$("#bill fieldset span").toggle()