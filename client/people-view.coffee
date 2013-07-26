#user = Meteor.users.findOne({_id:Meteor.userId()})
#console.log 'user ->', user

Template.people.helpers
    debts: ->
        debtor = Session.get "people"

        user = Meteor.users.findOne({_id:Meteor.userId()})

        return [] unless user
        #a:debtor,
        Debts.find({ a:debtor, b:user.username })

    credits: (creditor)->
        creditor = Session.get "people"
        user = Meteor.users.findOne({_id:Meteor.userId()})
        return [] unless user
        Debts.find({ a:user.username, b:creditor })#, b:creditor })
