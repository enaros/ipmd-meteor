Meteor.startup () ->
	# $.getScript 'js/lungo.debug.js' # , ->
	# Lungo.init
	# 	name: 'iPayMyDebts'
	# 	version: '0.1'
	# 	history: false

	# $('body').attr('data-device',"tablet").attr('data-position',"fixed")

	# Deps.autorun ->
	# 	if Meteor.user()?.services
	# 		window.getFriends()

	if Meteor.userId()
		Session.set 'active', 'list'
	else
		Session.set 'active', 'login'

Meteor.subscribe "debts"
Meteor.subscribe "user"
Meteor.subscribe "groups"
Meteor.subscribe "currentAccessToken"
Meteor.subscribe "stats"