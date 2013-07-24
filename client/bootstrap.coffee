Meteor.startup () ->
	$.getScript 'js/lungo.debug.js', ->
		Lungo.init
			name: 'iPayMyDebts'
			version: '0.1'
			history: false

		# $('section.show').removeClass 'show'
		# $('#login').addClass 'show'