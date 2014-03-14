
station = require './coffee/server'
net = require 'net'

station.start()

do repeat = ->
  setTimeout ->
    station.reload 'demo'
    repeat()
  , 1000