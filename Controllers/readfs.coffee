fs  = require 'fs'

#####################################
#########File Sytem reader###########
#####################################

func = (req, callback) ->  ## readfile function defentition.
  if req.url is '/readfile'
    fs.readFile 'public/text.txt', (err, data)->
      if !err
        return callback null, data
      else
        res.send 500, "Error!"
  else
    return new Error "Error!"

exports.readfs = (req, res)->

  func req, (err, result) ->
    if !err
      res.send result
    else
      res.send 500, err