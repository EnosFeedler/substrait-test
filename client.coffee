###
  CLIENT-SIDE PROGRAM
###

# subscribe to the 'name' property
substrait.get_stream 'name', (err, name) ->
  if err then console.log err else
    name.on 'data', (data) ->
      document.body.innerHTML = "Hello, #{data}!"