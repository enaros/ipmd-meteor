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

		whoOwesWhom = $('#bill [type=checkbox]').is(':checked')
		howMuch = parseInt($('#bill .howmuch').val())
		description = $('#bill .description').val()

		dbuser = Meteor.users.findOne 'services.facebook.id': selectedUser.id

		if not dbuser
			Meteor.call 'createFacebookUser', selectedUser, (error, id) ->
				if not error
					newDebt(Meteor.userId(), id, whoOwesWhom, howMuch, description, selectedUser.id)
				else
					console.log error
		else
			newDebt(Meteor.userId(), dbuser._id, whoOwesWhom, howMuch, description, selectedUser.id)

	'touch #fb-friend': ->
		Session.set 'facebook-bill', true
		window.goto "facebook"

	'touch [type=checkbox]': ->
		$("#bill fieldset span").toggle()

newDebt = (myId, hisId, whoOwesWhom, howMuch, description, hisFBid) ->
	debtor = if whoOwesWhom then myId else hisId
	creditor = if whoOwesWhom then hisId else myId

	Meteor.call 'addDebt', debtor, creditor, howMuch, description, (error, result) ->
		console.log 'Meteor.call.addDebt', error, result
		publishOnFacebook(hisFBid)

publishOnFacebook = (hisFBid) ->
	FB.ui {
		to: hisFBid
		method: 'feed'
		link: 'https://ipmd.meteor.com'
		picture: 'http://www.nfctags.com/images/android_tc_icon_151211.png'
		name: 'Emi 坐在大長的假陽具'
		caption: '666'
		description: 'u owe me coins!'
	}, (response) ->
		console.log response