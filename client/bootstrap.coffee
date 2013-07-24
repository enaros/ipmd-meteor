Meteor.startup () ->
	$.getScript 'js/lungo.debug.js', ->
		Lungo.init
			name: 'iPayMyDebts'
			version: '0.1'
			history: false

# if Meteor.isServer
# 	Meteor.startup( () ->
# 		# code to run on server at startup
# 	)