
station = require './coffee/server'

station.start()
setTimeout ->
  station.reload 'demo'
, 1000