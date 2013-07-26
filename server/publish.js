/*
Meteor.startup( function () {
    Meteor.methods({
        'groupedDebitors': function(userId){
            user = Meteor.users.findOne({_id:Meteor.userId()})
            dict = {}

            Debts.find({b:user.username}).map(function(debt){
              if (debt.a in dict){
                dict[debt.a].debt += debt.debt;
                if (dict[debt.a].date < debt.date)
                  dict[debt.a].date = debt.date;
              }
              else
                dict[debt.a] = {'a': debt.a, 'debt': debt.debt, 'tags': {}, 'date': debt.date}

              debt.tags.forEach(function(tag){
                if (!( tag in dict[debt.a].tags))
                  dict[debt.a].tags[tag] = true;

              });
            });
            return dict;
        },

        'groupedCreditors': function(userId){
            user = Meteor.users.findOne({_id:Meteor.userId()})
            dict = {}

            console.log(user)

            Debts.find({a:user.username}).map(function(debt){
              console.log('in map')
              console.log(debt)
              if (debt.b in dict){
                dict[debt.b].debt += debt.debt;
                if (dict[debt.b].date < debt.date)
                  dict[debt.b].date = debt.date;
              }
              else
                dict[debt.a] = {'b': debt.b, 'debt': debt.debt, 'tags': {}, 'date': debt.date}

              debt.tags.forEach(function(tag){
                if (!( tag in dict[debt.b].tags))
                  dict[debt.b].tags[tag] = true;

              });
            });
            return dict;
        }
    });

});
*/

