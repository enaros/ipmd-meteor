Meteor.startup () ->
	# $.getScript 'js/lungo.debug.js' # , ->
	# Lungo.init
	# 	name: 'iPayMyDebts'
	# 	version: '0.1'
	# 	history: false

	# $('body').attr('data-device',"tablet").attr('data-position',"fixed")
		
	if Meteor.userId()
		Session.set 'active', 'list'
	else
		Session.set 'active', 'login'

Meteor.subscribe("debts")
Deps.autorun -> Meteor.subscribe "user"
Meteor.subscribe("groups")