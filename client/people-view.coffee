Template.profile.helpers
	user: -> Session.get "people"

Template.debtCredit.helpers
	prettyDate: (date) -> window.prettyDate(date)
	description: (descr) -> if descr then descr else 'no description'

Template.people.helpers
	user: -> Session.get "people"
	active: -> if Session.get('active') is 'people' then 'show' else ''
	debts: ->
		debtor = Session.get "people"
		return unless debtor

		Debts.find 
			a: debtor._id
			b: Meteor.userId()

	credits: ->
		debtor = Session.get "people"
		return unless debtor

		Debts.find 
			b: debtor._id
			a: Meteor.userId()

Template.people.events
	'click #goback': -> Session.set 'active', 'list'
	"touch [data-control=groupbar] a": (ev, t) -> 
		$(t.findAll "[data-control=groupbar] a").removeClass "active"
		$(t.findAll "article").removeClass "active"
		$(ev.currentTarget).addClass "active"
		$('article#' + $(ev.currentTarget).attr "data-view-article").addClass "active"
		# [data-control=groupbar] a window.goto 'list'