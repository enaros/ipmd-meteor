Template.login.events
	'touch #login-button' : (e) ->
		Meteor.loginWithPassword $('#signup-name').val(), $('#signup-password').val(), (error) ->
			if error
				console.log error
				$('.cancel').show()
			else
				$('.cancel').hide()
				Lungo.Router.section('list')

				# $('#list').remove();
				# $('body').append(Meteor.render(Template.list)) unless $("#list").length