Template.charts.rendered = ->
  user = Meteor.users.findOne({_id: Meteor.userId()}).username

#  debts = Debts.find({a:username}).map (debt) ->
#    return debt.

  window.rawdata =
    [['Year', 'Debts', 'Credits']
     ['2004', 1000, 400]
     ['2005', 1170, 460]
     ['2006', 660, 1120]
     ['2007', 1030, 540]]

  drawChart = (data) ->
    chart = new google.visualization.ColumnChart(document.getElementById 'chart_div')
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
  data = google.visualization.arrayToDataTable window.rawdata
  google.setOnLoadCallback ->
    drawChart data
