do->	
	before = null
	after = 0
	operator = null
	result = document.getElementById("result")
	ip_bln = false
	ip = (n) ->
		after = if !ip_bln then 0 else after
		if after.length >16
			return

		if n == "00"
			ip("0")
			ip("0")
			return
		else if after.toString() == "0"
			after =  n.toString()							
		else 
			after = after.toString() + n.toString()
			after = if after.indexOf(".") < 0 then parseInt after else parseFloat after
			after = after.toString()
		ip_bln = true

		result.innerHTML = after.toString()
	dt = () ->
		after = if !ip_bln then 0 else after
		if after.toString().indexOf(".") < 0
			after = after + "."
			ip_bln = true
			result.innerHTML = after.toString()

	fo = (o,b,a)->
		r = null
		if o == "pl"
			r = new BigNumber(b).plus(a).toPrecision()
		else if o == "sb"
			r = new BigNumber(b).sub(a).toPrecision()
		else if o == "ml"
			r = new BigNumber(b).times(a).toPrecision()
		else if o == "dv"
			r = new BigNumber(b).div(a).toPrecision()
		else if o == "eq"
			r =  a
		if r > 999999999999999
			r = "ERR"
		r = r.toString().substring(0,16)
		return r
	cl = (o) ->
		if !ip_bln
			operator = o
			return
		r = null
		after = after.toString()
		after = if after.indexOf(".") < 0 then parseInt after else parseFloat after

		if before == null and !operator
			r = after
		else
		   r = fo operator,before,after
		result.innerHTML = r.toString()
		operator  = o
		after = r
		before = r		
		ip_bln = false
		return
	pm = ->
		after = if after.indexOf(".") < 0 then parseInt after else parseFloat after
		console.log after
		after = ((new BigNumber(after).toNumber().toPrecision()) * -1).toString()
		result.innerHTML = after.toString()
	ac = () ->
		after = 0
		before = null
		operator = null
		result.innerHTML = after.toString()
		return

	document.getElementById("b01").addEventListener "click", ()-> ip("1")
	document.getElementById("b02").addEventListener "click", ()-> ip("2")
	document.getElementById("b03").addEventListener "click", ()-> ip("3")
	document.getElementById("b04").addEventListener "click", ()-> ip("4")
	document.getElementById("b05").addEventListener "click", ()-> ip("5")
	document.getElementById("b06").addEventListener "click", ()-> ip("6")
	document.getElementById("b07").addEventListener "click", ()-> ip("7")
	document.getElementById("b08").addEventListener "click", ()-> ip("8")
	document.getElementById("b09").addEventListener "click", ()-> ip("9")
	document.getElementById("b00").addEventListener "click", ()-> ip("0")	
	document.getElementById("bzz").addEventListener "click", ()-> ip("00")
	document.getElementById("bdt").addEventListener "click", ()-> dt()
	document.getElementById("bpl").addEventListener "click", ()-> cl("pl")
	document.getElementById("bsb").addEventListener "click", ()-> cl("sb")
	document.getElementById("bml").addEventListener "click", ()-> cl("ml")
	document.getElementById("bdv").addEventListener "click", ()-> cl("dv")
	document.getElementById("beq").addEventListener "click", ()-> cl("eq")
	document.getElementById("bpm").addEventListener "click", ()-> pm()
	document.getElementById("bac").addEventListener "click", ()-> ac()
	return


