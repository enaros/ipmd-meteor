Template.stats.active = ->
  if Session.get('active') is 'stats' then 'show' else ''

Template.stats.events
  'click #goback': -> Session.set 'active', 'list'
  "touch [data-control=groupbar] a": (ev, t) ->
    $(t.findAll "[data-control=groupbar] a").removeClass "active"
    $(t.findAll "article").removeClass "active"
    $(ev.currentTarget).addClass "active"
    $('article#' + $(ev.currentTarget).attr "data-view-article").addClass "active"
    # [data-control=groupbar] a window.goto 'list'

Template.charts.rendered = ->

  change_cloud = (e) ->
    #d3.select("#wcdebt").remove()


  draw = (words) ->
    d3.select("#stats-container")
    .append("div")
    .attr("class","wc-container")
    .append("svg")
    .attr("width", 480)
    .attr("height", 300)
    .append("g")
    .attr("transform", "translate(150,150)")
    .selectAll("text")
    .data(words)
    .enter()
    .append("text")
    .on("mouseover", ->
      d3.select(this).style("font-size", (d) ->
        d.size + 10 +"px"
      )
    )
    .on("mouseout", ->
      d3.select(this).style("font-size", (d) ->
        d.size - 10 +"px"
      )
    )
    .on("mousedown",  ->
      console.log(this)
    )
    .style("font-family", "Impact"
    )
    .style("fill", (d, i) ->
      fill i
    )
    .attr("text-anchor", "middle"
    )
    .attr("transform", (d) ->
      "translate(" + [d.x+30, d.y+15] + ")rotate(" + d.rotate + ")"
    )
    .text( (d) ->
      d.text
    )

  object_to_array = (obj) ->
    arr = Array()
    $.each(obj, (key, val)->
      arr.push(
        text: key
        size: val*9
      )
    );
    arr


  fill = d3.scale.category20()

  d3.layout.cloud()
    .size([480, 300])
    .words(object_to_array(stats("a")))
    .padding(5)
    .rotate(->
      ~~(Math.random() * 2) * (Math.random()*90))
    .font("Impact").fontSize((d) ->
      d.size )
    .on("end", draw)
    .start()

  d3.layout.cloud()
    .size([480, 300])
    .words(object_to_array(stats("b")))
    .padding(5)
    .rotate(->
      ~~(Math.random() * 2) * (Math.random()*90))
    .font("Impact").fontSize((d) ->
      d.size)
    .on("end", draw)
    .start()
