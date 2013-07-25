Meteor.startup () ->
	$.getScript 'js/lungo.debug.js', ->
		Lungo.init
			name: 'iPayMyDebts'
			version: '0.1'
			history: false
		# $('section.show').removeClass 'show'
		# $('#login').addClass 'show'

		# if Meteor.userId()
		# 	Lungo.Router.section('list')

Meteor.subscribe("debts")
Meteor.subscribe("users")
Meteor.subscribe("groups")