exports.print = () ->
	return "From the Lib"

exports.again = () ->
	return "Once Again"

exports.cb = (cbk) ->
	string = "This is the callback"
	return cbk null, string
