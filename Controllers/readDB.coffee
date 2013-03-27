mongo = require 'mongoskin'
libs = require '../lib/mylib'
fs = require 'fs'
ejs = require 'ejs'

db = mongo.db 'localhost:27017/test?auto_reconnect', {safe:false}
  
#####################################
#########MongoDB reader##############
#####################################

exports.index = (req, res) ->
  x =  libs.print()
  y =  libs.again()
  console.log x,y
  libs.cb (err, callbk) ->
    if !err
      console.log callbk
      console.log "callback done"
  db.collection("test1").find().toArray (err, posts) ->
    if !err
      #res.send data
      obj  = {title: posts[0].name }
      res.render('index', obj)
      #res.send posts[0].name+'\n'
    else
      console.log 'error'
      res.send 500, 'error'