Template.features.profilePicture = ->
	fbid = Meteor.user()?.services?.facebook.id
	"<img src='https://graph.facebook.com/#{fbid}/picture'/>" if fbid

Template.features.events
	'touch #debts-item' : (e) ->
		# Lungo.Router.section('list')
		window.goto 'list'
<<<<<<< HEAD
		
	'touch #facebook-item' : (e) ->
		# Lungo.Router.section('list')
		window.goto 'facebook'
		
	'touch #new-bill-item' : (e) ->
		# Lungo.Router.section('list')
		window.goto 'bill'
		
=======

>>>>>>> stats
	'touch #logout-item' : (e) ->
		console.log 'trying to logout'
		Meteor.logout (error) ->
			console.log 'logout-successfull'
			if error
				console.log error
			else
				window.goto 'login'

	'touch #stats-item' : (e) ->
		window.goto 'stats'
