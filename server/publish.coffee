# Publish complete set of debts to all clients.

Meteor.publish 'debts', () ->
  Debts.find()

# Meteor.publish("myDebts", function(){
#     return Debts.find({'debtor':this.userId});
# })

# Meteor.publish("myCredits", function(){
#     return Debts.find({'creditor':this.userId});
# })

#
Meteor.publish "users", () ->
  Meteor.users.find {} #, { fields: {emails: 1, profile: 1} }