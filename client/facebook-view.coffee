Template.facebook.active = ->
	if Session.get('active') is 'facebook' then 'show' else 'hide'


Template.facebook.friends = ->
	f = Session.get('fb-filter')
	return if  not f or f.length < 3

	filter = new RegExp Session.get('fb-filter'), 'i'
	return _.filter window.friends?.data, (o) ->
		filter.test o.name

Template.facebook.events
	'touch #login-button' : (e) ->
		name = $('#signup-name').val()

	'keyup input': (e) ->
		Session.set 'fb-filter', $(e.currentTarget).val()


# window.friends = [
# 	{
# 		nombre: 'julian'
# 	}
# 	{
# 		nombre: 'raul'
# 	}
# 	{
# 		nombre: 'martita'
# 	}
# ]