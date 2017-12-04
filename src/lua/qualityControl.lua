--[[ 
    The Pokelua project 2015/2017
    Authors: Jordynl  
]]

qc.start = function(name) 
	if db.players[name].qc == false then
		db.players[name].qc = true
	    for i,key in ipairs({01,02,03,04,05,06,1337}) do
    		ui.removeTextArea(key, name)
	    end
	end
end

qc.stop = function(name, sillent)
	if db.players[name].qc then
		db.players[name].qc = false
		if db.players[name].basePokemon then
			object.updateInterface(name, db.players[name].objectData)
		else
			ui.addTextArea(1337, table.concat(db.players[name].console, "<br/>"), name, 560, 32, 230, 0x301A0C , 0x684422 , 0.8, true)
		end
	end
end