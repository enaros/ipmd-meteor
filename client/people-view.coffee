#user = Meteor.users.findOne({_id:Meteor.userId()})
#console.log 'user ->', user
Template.profile.helpers
    user: ->
        people = Session.get "people"
        Meteor.users.findOne({username: people})

Template.people.helpers
    active: ->
        if Session.get('active') is 'people' then 'show' else ''

    username: ->
         Session.get "people"

    debts: ->
        debtor = Session.get "people"
        user = Meteor.users.findOne({_id:Meteor.userId()})

        return [] unless user
        Debts.find({ a:debtor, b:user.username })

    credits: ->
        creditor = Session.get "people"
        user = Meteor.users.findOne({_id:Meteor.userId()})

        return [] unless user
        Debts.find({ a:user.username, b:creditor })#, b:creditor })

Template.people.events
    'click #goback': ->
        Session.set 'active', 'list'
