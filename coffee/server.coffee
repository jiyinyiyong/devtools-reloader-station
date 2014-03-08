
net = require 'net'

EventEmitter = require('events').EventEmitter
WebSocketServer = require('ws').Server

exports.start = ->

  wss = new WebSocketServer port: 8887
  station = new EventEmitter

  station.on 'data', (data) ->
    console.log 'station got:', data

  wss.on 'connection', (ws) ->
    station.on 'data', (data) ->
      ws.send data

  net
  .createServer (socket) ->
    socket.on 'data', (data) ->
      station.emit 'data', data.toString()
  .listen 8888

exports.reload = (pattern) ->
  client = net.connect port: 8888, ->
    client.write 'hello from client'
