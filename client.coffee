###
  CLIENT-SIDE PROGRAM
###

# handle name
substrait.get_stream 'name', (err, name) ->
  if err then console.log err else
    name.on 'data', (data) ->
      document.body.innerHTML = "Hello, #{data}!"
      document.title = data

# handle verification
substrait.get_stream 'google_site_tags', (err, tags) ->
  if err then console.log err else
    tags.on 'data', (data) ->
      data = JSON.parse data
      for tag in data
        console.log tag