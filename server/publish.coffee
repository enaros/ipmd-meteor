Meteor.publish "debts", () ->
  Debts.find {}

Meteor.publish "user", () ->
  Meteor.users.find { _id: this.userId }, { fields: {emails: 1, username: 1} }

Meteor.publish "groups", () ->
  Groups.find {}

Meteor.publish "stats", () ->
    Stats.find {}