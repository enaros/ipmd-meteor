###
Debts.insert({
	a:'emiliano', 
	b:'susano', 
	debt: 50, 
	auth: true, 
	paid: false,
	tags: [
		'beer',
		'friday party'
	]
})
###
Debts = new Meteor.Collection("debts")

# Publish complete set of debts to all clients.
Meteor.publish 'debts', () ->
  Debts.find()