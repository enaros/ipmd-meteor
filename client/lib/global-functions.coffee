window.goto = (donde) ->
	Session.set 'active', donde

window.getFriends = ->
	FB.api '/me/friends', {access_token: Meteor.user().services?.facebook.accessToken }, (response) ->
		console.log(response)
		window.friends = response