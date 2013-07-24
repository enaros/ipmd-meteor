Template.login.events
	'touch button' : (e) ->
		# template data, if any, is available in 'this'
		console.log 'login'
		Session.set 'user', 'emiliano'
		$('#groups').remove();
		$('body').append(Meteor.render(Template.groups))