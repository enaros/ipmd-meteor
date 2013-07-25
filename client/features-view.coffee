Template.features.username = ->
	user = Meteor.users.findOne({_id:Meteor.userId()})
	if user then user.username else ''

Template.features.events
	'touch #debts-item' : (e) ->
		Lungo.Router.section('list')
		
	'touch #logout-item' : (e) ->
		console.log 'trying to logout'
		Meteor.logout (error) ->
			if error 
				console.log error
			else
				Lungo.Router.section('login')