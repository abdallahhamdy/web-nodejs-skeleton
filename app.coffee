express = require 'express'
path = require 'path'
route = require('./routes')
app = express()

#####################################
#########Main App Configuration######
#####################################

process.env.PORT = 5000

app.configure () ->	
  app.set('port', process.env.PORT)# || 5000)
  app.use(express.logger('dev'))
  app.set('views', __dirname + '/views')
  app.set('view engine', 'ejs')
  app.use(app.router)
  app.use(express.static(path.join(__dirname, 'public')))


require('./routes')({app:app})

app.listen process.env.PORT

console.log "Starting Server on port #{process.env.PORT}"
