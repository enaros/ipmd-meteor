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