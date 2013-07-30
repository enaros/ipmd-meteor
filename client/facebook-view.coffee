Template.facebook.active = ->
	if Session.get('active') is 'facebook' then 'show' else 'hide'


Template.facebook.friends = ->
	f = Session.get 'fb-filter'
	return if  not f or f.length < 3

	filter = new RegExp Session.get('fb-filter'), 'i'
	return _.filter window.friends?.data, (o) ->
		filter.test o.name

Template.facebook.events
	'touch #login-button' : (e) ->
		name = $('#signup-name').val()

	'keyup input': (e) ->
		Session.set 'fb-filter', $(e.currentTarget).val()

	'touch li': (e) ->
		img = $(e.currentTarget).find('img').attr('src')
		$('#facebook .form').prepend "<div class='fb-mini' style='background-image:url(#{img})' id='#{@.id}'></div>"
		$('#facebook .form input').val('').focus()
		Session.set 'fb-filter', ''

	'touch .fb-mini': (e) ->
		$(e.currentTarget).remove()
	
	'touch .ok-sign': (e) ->
		alert _.reduce $('#facebook .fb-mini'), ((memo, o) -> memo + "\n" + $(o).attr('id')), ''
