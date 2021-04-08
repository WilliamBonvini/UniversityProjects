open util/integer
open util/boolean

/**------------------SIGNATURES------------------**/

//List of values registered from the device (simplified).
//Also has a timestamp which indicates when the values were taken, and a boolean which is true if the values
//denote a dangerous condition for the user's health
sig ValuesList {
	pressure: Int,
	temperature: Int,
	heartbeat: Int,
	timestamp: Int,
	dangerousCondition: one Bool
} {pressure >= 0 and pressure <= 5 and
	temperature >= 0 and temperature <= 5 and
	heartbeat >= 0 and heartbeat <= 5 and
	timestamp >= 0 and timestamp <= 2
}

//the device of a user
sig Device {
	values: set ValuesList
} {#values = 3}

//a call sent to the nearest hospital. Contains the device which made it, with its data, and the time of the call.
sig Call {
	caller: one Device,
	timestamp: one Int
}

/**------------------FACTS------------------**/

//a valuesList belongs only to a device
fact ValuesListsBoundedToDevice {
	all v: ValuesList |
		one d: Device |
			v in d.values
}

//different ValuesLists have different timestamps if they belong to the same device
fact DevicesValuesListsHaveDistinctTimestamps {
	all disj v1, v2: ValuesList |
		(one d: Device |
			v1 in d.values and v2 in d.values)
		implies
		v1.timestamp != v2.timestamp
}

//definition of dangerous values. For simplicity, is 0 or 5 for temperature and pressure, 0 for heartbeat
fact WhenValuesAreDangerous {
	all v: ValuesList |
		v.dangerousCondition = True 
		iff
		((v.pressure = 0 or v.pressure = 5) or
		(v.temperature = 0 or v.temperature = 5) or
		(v.heartbeat = 0))
}

//calls are made from a device that has at least one valuesList with dangerousValue true
fact CallsFromEndangeredUsers {
	all c: Call |
		one v:ValuesList |
			v in c.caller.values and
			v.dangerousCondition = True and
			c.timestamp = v.timestamp
}

//if a user is in dangerous condition, a call is always made
fact CallsAreMandatory {
	all v:ValuesList |
		one d:Device|
			(v in d.values and
			v.dangerousCondition = True)
			implies
			some c: Call |
				c.caller = d
}


//2 calls with same caller and timestamp cannot exist
fact NoSameCall {
	no disj c1, c2: Call |
		(c1.caller = c2.caller and
		c1.timestamp = c2.timestamp)
}

//calls are made in the first moment (timestamp) the values are dangerous
fact CallsAtFirstDangerousCondition {
	all c: Call |
		no v1, v2: ValuesList |
			v1.dangerousCondition = True and
			v2.dangerousCondition = True and
			c.timestamp = v1.timestamp and
			v1 in c.caller.values and
			v2 in c.caller.values and
			v1.timestamp > v2.timestamp 
}

/**------------------ASSERTIONS------------------**/

//at most there's only one call per device
assert MaxOneCallPerDevice {
	all d:Device |
		lone c:Call |
			c.caller = d
}

/**------------------PREDICATES------------------**/

//show a device without dangerous condition and that there are no calls in this case
pred showDeviceInSafeConditions {
	some d: Device |
		True not in d.values.dangerousCondition
}


//show a device in dangerous condition starting from timestamp 1, to show that the call is made exactly when the
//values are dangerous, and that after that no other calls are made
pred showDeviceInDangerousCondition {
	some d:Device |
		True in d.values.dangerousCondition
		and
		(some disj v1, v2: ValuesList |
			v1 in d.values and v2 in d.values and
			v1.timestamp = 0 and v1.dangerousCondition = False and
			v2.timestamp = 1 and v2.dangerousCondition = True
		)
		
}

check MaxOneCallPerDevice

run showDeviceInSafeConditions for 3

run showDeviceInDangerousCondition for 3
