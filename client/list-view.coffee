Template.list.culo = ->
	Session.get "culo"

Template.list.preserve ['header']

Template.list.events
	'touch section#list a[data-icon=plus]': ->
		console.log "meteor + preesed in list", @
		Lungo.Notification.confirm({
			icon: 'user'
			title: 'New One'
			description: 'Hallo poolly'
			accept:
				icon: 'checkmark'
				label: 'Accept'
				callback: (e) -> console.log "yes!"
			cancel:
				icon: 'close'
				label: 'Cancel'
				callback: (e) -> console.log "no!"
		})