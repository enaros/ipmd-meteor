Template.login.active = ->
	if Session.get('active') is 'login' then 'show' else ''

Template.login.events
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