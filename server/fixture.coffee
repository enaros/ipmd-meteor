init_stats = () ->
  Stats.insert  'user': 'luchux',
                'debt_tags': [{'beer':10, 'trolas':2}],
                'cred_tags': [{'food':5, 'sports':20}],
                'debt_users': ['enaros':200, 'david':100],
                'cred_users': ['enaros':50]

Meteor.startup ->
  init_stats

  if Meteor.users.find().count() is 0 or Meteor.users.find().count() < 3
    user1 =
      email: 'l@l.com'
      password: '90orcudd'
      username: 'luchux'

    user2 =
      email: 'e@e.com'
      password: '90orcudd'
      username: 'enaros'

    user3 =
      email: 'd@d.com'
      password: '90orcudd'
      username: 'David'

    Accounts.createUser(user) for user in [user1, user2, user3]


    if Debts.find().count() is 0 and Meteor.users.find().count() > 1
      now = new Date()
      user1 = Meteor.users.find().fetch()[0]
      user2 = Meteor.users.find().fetch()[1]
      user3 = Meteor.users.find().fetch()[2]

      Debts.insert({'a':user1.username, 'b':user2.username, 'debt':345, 'descr':'The beers and pingpong of last week', 'date':now, 'auth':true, 'paid':false, 'tags': ['beer','pingpong','dinner']})

      Debts.insert({'a':user1.username, 'b':user2.username, 'debt':40, 'descr':'Red Street night...', 'date':now, 'auth':true, 'paid':false, 'tags': ['trolas', 'beer'] })

      Debts.insert({'a':user3.username, 'b':user2.username, 'debt':7, 'descr':'Coffee and bread at Chapel St.', 'date':now, 'auth':true, 'paid':false, 'tags': ['coffee','breakfast']})

      Debts.insert({'a':user1.username, 'b':user2.username, 'debt':15, 'descr':'Paddle with the mates', 'date':now, 'auth':true, 'paid':false, 'tags': ['paddle', 'friends'] });

    if Groups.find().count() is 0 and Meteor.users.find().count() > 2
        user1 = Meteor.users.find().fetch()[0]
        user2 = Meteor.users.find().fetch()[1]
        myself = Meteor.users.find().fetch()[2]

        Groups.insert({name: 'lopibe', user: myself.username, listUsers:[user1, user2] })

        Groups.insert({ name: 'family', user: user1.username, listUsers: [myself] })