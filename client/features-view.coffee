Template.features.username = ->
	user = Meteor.users.findOne({_id:Meteor.userId()})
	if user then user.username else ''

Template.features.events
	'touch #logout' : (e) ->
		console.log 'trying to logout'
		Meteor.logout (error) ->
			if error 
				console.log error
			else
				Lungo.Router.section('login')