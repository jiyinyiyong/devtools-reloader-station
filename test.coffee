
station = require './coffee/server'
net = require 'net'

station.start()

do repeat = ->
  setTimeout ->
    client = net.connect port: 8888, ->
      client.write 'repo/'
    repeat()
  , 4000