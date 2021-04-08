/**------------------SIGNATURES------------------**/
//The user of the Track4Run application. Has a set of Runs he/she created, a set of Runs to which he/she is
//subscribed and a set of accessible maps of runs. 
sig User {
	createdRuns: set Run,
	subscribedRuns: set Run
}

//this represent a certain time in a day. It's not specified a precise amount of time for abstraction and simplicity
//of the model, but ideally represent the time in which a run is held.
sig Time{}

//list of visible users in a precise time. This is an information independent from any particular user, because
//each user can see any run, if the run is underway, and cannot if it's finished or has yet to start
sig VisibleUsersInACertainTime {
	timeOfVisibility: one Time,
	visibleUsers: set User
}

//this represents a point in the real world (simplified).
sig MapPoint {}


//A Run is an event created by one user (who can join as a participant or not join at all)
//and has a defined track, a map seen by spectators only and a time indicating when the run is held
sig Run {
	creator: one User,
	participants: set User,
	track: set MapPoint, //for simplicity a track is only defined by 2 or more MapPoint
	realTimeMap: one RealTimeMap,
	time: one Time
}
{#track >= 2 and
#participants >= 2}  //for simplicity there are always at least 2 participants.



//a map for a run.
sig RealTimeMap {
	visibleUsers: set User,
	//this represent the time when users are visible to the spectators of the relative run
	visibilityTime: one Time
}


/**------------------FACTS------------------**/

//A user subscribed to a run must be in that run as a participant
fact UserInRunIfSubscribed {
	all u: User, r: Run |
		r in u.subscribedRuns implies
		u in r.participants
}

//the set of runs created is linked to the creator of the run
fact UserCreatorOfRuns {
	all u: User, r: Run |
		r in u.createdRuns iff
		u = r.creator
}

//the time of a run is the visibility time of its associated map
fact RunAndMapHaveSameTime {
	all r:Run |
		r.realTimeMap.visibilityTime = r.time
}

//all maps are associated with 1 and only run
fact MapsBoundedToOneRun{
	all m: RealTimeMap |
		one r:Run |
			m = r.realTimeMap
}

//in each run's map the users are the only users which are subscribed as participant of that run
fact usersOfAMap {
	all m: RealTimeMap, r:Run |
		m.visibleUsers = r.participants iff
		m = r.realTimeMap
}
	

//for each time is defined 1 and only 1 list of visibleUsersInACertainTime
fact VisibleUsersDefinedForEachTime {
	all t:Time |
		one v:VisibleUsersInACertainTime |
			v.timeOfVisibility = t
}

//for each time all the visible users are all and only the ones subscribed to runs which are held in that time
fact DefinitionOfVisibleUsers {
	all v:VisibleUsersInACertainTime, u:User |
		u in v.visibleUsers iff
		(some r:Run |
			r in u.subscribedRuns and
			r.time = v.timeOfVisibility)
}

/**------------------ASSERTIONS------------------**/

//check that users who are not subscribed to any run are never visible.
assert NoVisibleUserNotSubscribed {
	all v:VisibleUsersInACertainTime, u:User |
		#u.subscribedRuns = 0 implies
		u not in v.visibleUsers
}


/**------------------PREDICATES------------------**/

//show a user which is visible in a time but not in another
pred showUserVisibleForLimitedTime {
	some u:User, v1, v2: VisibleUsersInACertainTime |
		u in v1.visibleUsers and u not in v2.visibleUsers
}

//show that a creator can join as a participant
pred showUserCreatorAndSubscriber{
	some u:User |
		some r: Run |
			u = r.creator and
			u in r.participants
}


check NoVisibleUserNotSubscribed

run showUserCreatorAndSubscriber for 2 but 3 User

run showUserVisibleForLimitedTime for 2 but 3 Time
