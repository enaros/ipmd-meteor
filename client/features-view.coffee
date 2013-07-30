Template.features.username = ->
	user = Meteor.users.findOne({_id:Meteor.userId()})
	if user then user.username else ''

Template.features.events
	'touch #debts-item' : (e) ->
		# Lungo.Router.section('list')
		window.goto 'list'
		
	'touch #facebook-item' : (e) ->
		# Lungo.Router.section('list')
		window.goto 'facebook'
		
	'touch #logout-item' : (e) ->
		console.log 'trying to logout'
		Meteor.logout (error) ->
			console.log 'logout-successfull'
			if error 
				console.log error
			else
				window.goto 'login'