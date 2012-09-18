###
  SERVER-SIDE PROGRAM
###

http = require 'http'
express = require 'express'
substrait = require 'substrait'

# main web app
app = express()

# subscribe to c_core
app.get '/', (req, res, next) ->
  substrait.get_stream 'c_core', (err, c_core) ->
    if err then next new Error err else
      res.send c_core

# also server hello, world on another endpoint
app.get '/ping', (req, res) ->
  res.send 'pong!'

# serve the app via http
server = http.createServer app

# make app live
server.listen substrait.get_www_port()