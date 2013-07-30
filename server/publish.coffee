Meteor.publish "debts", () ->
	Debts.find {}

Meteor.publish "user", () ->
	Meteor.users.find {}

Meteor.publish "groups", () ->
	Groups.find {}

Meteor.publish "currentAccessToken", ->
	 Meteor.users.find this.userId, fields: {'services.facebook.accessToken': 1}