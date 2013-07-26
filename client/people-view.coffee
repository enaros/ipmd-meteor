#user = Meteor.users.findOne({_id:Meteor.userId()})
#console.log 'user ->', user
Template.profile.helpers
    user: ->
        people = Session.get "people"
        Meteor.users.findOne({username: people})


Template.people.helpers
    debts: ->
        #debtor = Session.get "people"
        debtor = "luchux"

        #drogba = Session.get "people"
        console.log "hola"
        user = Meteor.users.findOne({_id:Meteor.userId()})

        return [] unless user
        #a:debtor,
        Debts.find({ a:debtor, b:user.username })

    credits: ->
        #creditor = Session.get "people"
        creditor = "David"
        user = Meteor.users.findOne({_id:Meteor.userId()})
        return [] unless user
        Debts.find({ a:user.username, b:creditor })#, b:creditor })
