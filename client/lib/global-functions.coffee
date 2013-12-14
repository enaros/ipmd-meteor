window.goto = (donde) ->
	Session.set 'active', donde

window.getFriends = ->
	FB.api '/me/friends', {access_token: Meteor.user().services?.facebook.accessToken }, (response) ->
		console.log(response)
		window.friends = response

window.prettyDate = (d) ->
	d_names = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
	m_names = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

	curr_day = d.getDay()
	curr_date = d.getDate()
	curr_month = d.getMonth()
	curr_year = d.getFullYear()

	sup = ""
	if curr_date is 1 or curr_date is 21 or curr_date is 31
		sup = "st"
	else if curr_date is 2 or curr_date is 22
		sup = "nd"
	else if curr_date is 3 or curr_date is 23
		sup = "rd"
	else
		sup = "th"

	d_names[curr_day] + " " + curr_date + "<sup>" + sup + "</sup> " + m_names[curr_month] + " " + curr_year


window.stats = (query) ->

  create = (debt) ->
    for key, tag of debt.tags
      if tag of create.tags
        create.tags[tag] += 1
      else
        create.tags[tag] = 1

  #user_id = Meteor.userId()
  create.tags = {}

  #Debts.find({ b:user_id }).map (debt) ->
  #Debts.find({s}).map (debt) ->
  #  create(debt)
  if query is "a"
    create.tags =
      beer: 5
      "ping pong": 3
      lectures: 4
      friends: 3
      dinners: 4
      coffee: 7
      bbq: 5
      petrol: 2
      gifts: 4
      electricty: 4
      water: 4
      bills: 8

  if query is "b"
    create.tags =
      beer: 2
      tennis: 4
      friends: 2
      campings: 5
      "going out": 8
      pizzas: 4
      wines: 2
      gifts: 4
      water: 2
      parties: 5
      parking: 4

  create.tags
