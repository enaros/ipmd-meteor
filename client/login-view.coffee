Template.login.events
	'touch #login-button' : (e) ->
		name = $('#signup-name').val()
		pass = $('#signup-password').val()
		
		return unless name and pass

		Meteor.loginWithPassword name, pass, (error) ->
			if error
				console.log error
				$('.cancel').show()
			else
				$('.cancel').hide()
				Lungo.Router.section('list')

				# $('#list').remove();
				# $('body').append(Meteor.render(Template.list)) unless $("#list").length