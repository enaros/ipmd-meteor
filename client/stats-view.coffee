Template.stats.active = ->
  if Session.get('active') is 'stats' then 'show' else ''

Template.charts.rendered = ->
  user = Meteor.users.findOne({_id: Meteor.userId()}).username
  tagsDebt = stats()
  tagsCred = stats()

  keys = []
  keys.push(tag) for tag,val in tagsDebt
  keys.push(tag) for tag,val in tagsCred

  window.debtData = [['Tag', 'Debts']]
  window.debtData.push [key,val] for key,val of tagsDebt
  console.log 'debtData', window.debtData

  window.credData = [['Tag', 'Credits']]
  window.credData.push [key,val] for key,val of tagsCred
  console.log 'credData', window.credData

  drawChart = (data, where) ->
    chart = new google.visualization.ColumnChart(document.getElementById where)
    chart.draw data,
      title: 'Company Performance'
      hAxis:
        title: 'Year'
        titleTextStyle:
          color: 'red'

  ###
  drawTable = (data) ->
    table = new google.visualization.Table(document.getElementById 'table_div')
    table.draw data
  ###

  dataDebt = google.visualization.arrayToDataTable window.debtData
  dataCred = google.visualization.arrayToDataTable window.credData
  console.log dataDebt
  console.log dataCred

  google.setOnLoadCallback ->
    drawChart(dataDebt,'chart_div')
    drawChart(dataCred, 'chart2_div')
