# Accounts.onCreateUser (opt, user) ->
# 	user.services =
# 		facebook:
# 			id: 123
# 			name: 'mariposa multicolor'

# 	user

# Meteor.users.remove({_id:'xin8BgxWvAse95JyT'})

Meteor.methods
	createFacebookUser: (facebookUser) ->
		Meteor.users.insert
			profile:
				name: facebookUser.name
			services:
				facebook: facebookUser

	addDebt: (debtor, creditor, howmuch, description) ->
		Debts.insert
			a: debtor
			b: creditor
			debt: howmuch
			descr: description
			date: new Date()
			auth: true
			paid: false
			tags: ['beer','pingpong','dinner']


Accounts.loginServiceConfiguration.remove
	service: "facebook"

Accounts.loginServiceConfiguration.insert
	service: "facebook"
	appId: "610153542362253"
	secret: "a5194266a7b35985a0c15968497bcbea"

