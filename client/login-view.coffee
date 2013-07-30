Template.login.active = ->
	if Session.get('active') is 'login' then 'show' else ''

Template.login.events
	'touch #login-fb-button' : (e) ->
		console.log 'fb login'
		Meteor.loginWithFacebook({
			requestPermissions: ['email']
		}, (err) ->
			if (err)
				console.log 'fb-login-error', err
			else
				window.goto 'facebook'
		)


	'touch #login-button' : (e) ->
		name = $('#signup-name').val()
		pass = $('#signup-password').val()
		
		return unless name and pass

		Meteor.loginWithPassword {username: name}, pass, (error) ->
			if error
				console.log error
				$('.cancel').show()
			else
				$('.cancel').hide()
				window.goto 'list'
				# $('#list').remove();
				# $('body').append(Meteor.render(Template.list)) unless $("#list").length