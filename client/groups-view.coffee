Template.groups.culo = ->
	Session.get "culo"

Template.groups.preserve ['header']

Template.groups.rendered = ->
	console.log 'groups-rendered', this
	$("#groups").addClass "show" unless $('section.show').length
	Lungo.Boot.Data.init('#groups')

Template.groups.events
	'touch section#groups a[data-icon=plus]': ->
		console.log "meteor + preesed in groups", @
		Lungo.Notification.confirm({
			icon: 'user'
			title: 'New group'
			description: '<b>Please</b> choose the name of the new group. Later you will be able to add people.'
			accept:
				icon: 'checkmark'
				label: 'Accept'
				callback: (e) -> console.log "yes!"
			cancel:
				icon: 'close'
				label: 'Cancel'
				callback: (e) -> console.log "no!"
		})