Template.people.active = ->
	if Session.get('active') is 'people' then 'show' else ''