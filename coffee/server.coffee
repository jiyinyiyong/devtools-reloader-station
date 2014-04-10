
net = require 'net'

EventEmitter = require('events').EventEmitter
WebSocketServer = require('ws').Server

launchServer = ->

  wss = new WebSocketServer port: 8887
  station = new EventEmitter

  station.on 'data', (data) ->
    console.log 'tab reload:', data

  wss.on 'connection', (ws) ->
    station.on 'data', (data) ->
      try
        ws.send data
      catch error
        console.log 'connection already closed'

  net
  .createServer (socket) ->
    socket.on 'data', (data) ->
      station.emit 'data', data.toString()
  .listen 8888

exports.start = ->
  client = net
  .createServer()
  .listen 8888
  .once 'error', (error) ->
    console.log 'already watching at 8888'
  .once 'listening', ->
    console.log 'start watching at 8888'
    client.close()
  .once 'close', launchServer

exports.reload = (pattern) ->
  client = net.connect port: 8888, ->
    client.write pattern
  client.once 'listening', ->
    setTimeout ->
      client.destroy()
      console.log 'close'
    , 1000