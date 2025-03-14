/datum/atc_chatter/traveladvisory/squak()
	//Control event: travel advisory
	switch(phase)
		if(1)
			SSatc.msg("[callname], all vessels in the [using_map.starsys_name] system. Priority travel advisory follows.")
			next()
		else
			var/flightwarning = pick("Solar flare activity is spiking and expected to cause issues along main flight lanes [rand(1,33)], [rand(34,67)], and [rand(68,100)]","Pirate activity is on the rise, stay close to System Defense vessels","We're seeing a rise in illegal salvage operations, please report any unusual activity to the nearest SDF vessel via channel [SSatc.sdfchannel]","A quarantined [pick("fleet","convoy")] is passing through the system along route [rand(1,100)], please observe minimum safe distance","A prison [pick("fleet","convoy")] is passing through the system along route [rand(1,100)], please observe minimum safe distance","Traffic volume is higher than normal, expect processing delays","Anomalous bluespace activity detected [pick("along route [rand(1,100)]","in sector [rand(1,100)]")], exercise caution","Smugglers have been particularly active lately, expect increased security scans","Depots are currently experiencing a fuel shortage, expect delays and higher rates","Asteroid mining has displaced debris dangerously close to main flight lanes on route [rand(1,100)], watch for potential impactors","A [pick("fuel tanker","cargo liner","passenger liner","freighter","transport ship","mining barge","salvage trawler")] has collided with [pick("a fuel tanker","a cargo liner","a passenger liner","a freighter","a transport ship","a mining barge","a salvage trawler","a meteoroid","a cluster of space debris","an asteroid","an ice-rich comet")] near route [rand(1,100)], watch for debris and do not impede emergency service vessels","A [pick("fuel tanker","cargo liner","passenger liner","freighter","transport ship","mining barge","salvage trawler")] on route [rand(1,100)] has experienced total engine failure. Emergency response teams are en route, please observe minimum safe distances and do not impede emergency service vessels","Transit routes have been recalculated to adjust for planetary drift. Please synch your astronav computers as soon as possible to avoid delays and difficulties","[pick("Bounty hunters","System Defense officers","Mercenaries")] are currently searching for a wanted fugitive, report any sightings of suspicious activity to System Defense via channel [SSatc.sdfchannel]",10;"It's space [pick("carp","shark")] breeding season. [pick("Stars","Skies","Gods","God","Goddess","Fates")] have mercy on you all","We're reading [pick("void","drive","sensor")] echoes that are consistent with illegal cloaking devices, be alert for suspicious activity in your sector")
			SSatc.msg("[flightwarning]. Control out.")
			finish()

/datum/atc_chatter/pathwarning/squak()
	//Control event: warning to a specific vessel
	switch(phase)
		if(1)
			var/navhazard = pick("a pocket of intense radiation","a pocket of unstable gas","a debris field","a secure installation","an active combat zone","a quarantined ship","a quarantined installation","a quarantined sector","a live-fire SDF training exercise","an ongoing Search & Rescue operation","a hazardous derelict","an intense electrical storm","an intense ion storm","a shoal of space carp","a pack of space sharks","an asteroid infested with gnat hives","a protected space ray habitat","a region with anomalous bluespace activity","a rogue comet")
			SSatc.msg("[combined_first_name], [callname]. Your [pick("ship","vessel","starship")] is approaching [navhazard], observe minimum safe distance and adjust your heading appropriately.")
			next()
		if(2)
			var/confirm = pick("Understood","Roger that","Affirmative","Our bad","Thanks for the heads up")
			SSatc.msg("[confirm] [callname], adjusting course.","[comm_first_name]")
			next()
		else
			SSatc.msg("Your compliance is appreciated, [combined_first_name].")
			finish()

/datum/atc_chatter/civvieleaks/squak()
	//Civil event: leaky chatter
	switch(phase)
		if(1)
			var/commleak = pick("thatsmywife","missingkit","pipeleaks","weirdsmell","weirdsmell2","scug","teppi")
			switch(commleak)
				if("thatsmywife")
					SSatc.msg("-so then I says to him, |that's no [pick("space carp","space shark","vox","garbage scow","freight liner","cargo hauler","superlifter")], that's my +wife!+| And he-","[comm_first_name]")
					next()
				if("missingkit")
					SSatc.msg("-did you get the kit from down on deck [rand(1,4)]? I need th-","[comm_first_name]")
					next()
				if("pipeleaks")
					SSatc.msg("I swear if these pipes keep leaking I'm going to-","[comm_first_name]")
					next()
				if("weirdsmell")
					SSatc.msg("-and where the hell is that smell coming fr-","[comm_first_name]")
					next()
				if("weirdsmell2")
					SSatc.msg("-hat in the [pick("three","five","seven","nine")] hells did you |eat| [pick("ensign","crewman")]? This compartment reeks of-","[comm_first_name]")
					next()
				if("scug")
					SSatc.msg("-and if that weird cat of yours keeps crawling into the pipes we-","[comm_first_name]")
					next()
				if("teppi")
					SSatc.msg("-at are we supposed to do with this damn cow?","[comm_first_name]")
					next(1,PROC_REF(teppi_next)) // Someone had to be a snowflake
		if(2)
			SSatc.msg("[combined_first_name], your internal comms are leaking[pick("."," again.",", again.",". |Again|.")]")
			next()
		else
			SSatc.msg("Sorry Control, won't happen again.","[comm_first_name]")
			finish()

/datum/atc_chatter/civvieleaks/proc/teppi_next()
	SSatc.msg("I don't think it's a cow, sir, it looks more like a-","[comm_first_name]")
	next()

/datum/atc_chatter/slogan/squak()
	switch(phase)
		if(1)
			SSatc.msg("The following is a sponsored message from [name].","Facility PA")
			next()
		else
			SSatc.msg("[slogan]","Facility PA")
			finish()

/datum/atc_chatter/misc/squak()
	//time for generic message
	switch(phase)
		if(1)
			SSatc.msg("[callname], [combined_first_name] on [mission] [pick(mission_noun)] to [destname], requesting [request].","[comm_first_name]")
			next()
		if(2)
			SSatc.msg("[combined_first_name], [callname], [response].")
			next()
		else
			SSatc.msg("[callname], [yes ? "thank you" : "understood"], out.","[comm_first_name]")
			finish()
