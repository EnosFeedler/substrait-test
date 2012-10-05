###
  SERVER-SIDE PROGRAM
###

http = require 'http'
express = require 'express'
substrait = require 'substrait'

# main web app
app = express()

# subscribe to client
app.get '/', (req, res, next) ->
  substrait.get_stream 'c_core', (err, client) ->
    if err then next new Error err else
      res.send client

# serve the app via http
server = http.createServer app

# make app live
server.listen substrait.get_www_port()