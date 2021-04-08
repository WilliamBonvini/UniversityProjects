open util/integer
open util/boolean

/**------------------SIGNATURES------------------**/

//position of a user, represented with 2 simplified coordinates
sig Position {
	latitude: one Int,
	longitude: one Int
}
{latitude >= 0 and latitude <= 2 and longitude >= 0 and longitude <= 2}


//gender of a user
abstract sig Gender{}
one sig Male extends Gender{}
one sig Female extends Gender{}

//data of a user, retrieavable from TPs through Data4Help services
sig UserData {
	position: one Position,
	age: one Int,
	gender: one Gender
}
{age >= 0 and age <= 5}

//User of Data4Help
sig User {
	data: one UserData
}

//Registered TP which can do global queries and requests to specific users.
sig ThirdParty {
	grantingUsers: set User
}

//a request made by a TP to a User to grant access to the TP to the user's data, if accepted from user.
sig Request {
	thirdParty: one ThirdParty,
	user: one User,
	grantedAccess: lone Bool
	//the Bool is lone because if the Bool is not set means the request is still pending
}

/*a Query made by a TP to the Data4Help database. The query is considered valid only if the number
  of results is greater or equal to 3 (for alloy model-simplification, instead of 1000).
  It can be formulated on 0 or more variables, contained in UserDatas. With 0 variables is a global
  query and returns all the Database.
  A query has no reference to a TP because there are no constraints depending on which TP formulates it
*/
sig Query {
	isValid: Bool,
	usersResult: set UserData,
	groupByPosition: Bool,
	position: lone Position,
	groupByAge: Bool,
	age: lone Int,
	groupByGender: Bool,
	gender: lone Gender
}

/**------------------FACTS------------------**/

//at most one request can exist for each couple (third party, user)
fact OnlyOneRequestForEachCouple{
	all disj r1, r2: Request |
		((r1.thirdParty != r2.thirdParty) or
		(r1.user != r2.user))
}

//each User has its own distinct UserData
fact UniqueUserData {
	all disj u1, u2:User |
		u1.data != u2.data
}

//each UserData belongs to a User
fact UserDataBoundToUser {
	all ud:UserData |
		some u:User |
			u.data = ud
}
	

//each user in list of a third party's granted user list has agreed to one and only request with that specific third party
fact ThirdPartyKnownUsersMustHaveAgreed {
	all u: User, tp:ThirdParty |
		u in tp.grantingUsers
		implies
		(one r:Request |
		r.thirdParty = tp and r.user = u and r.grantedAccess = True)
}

//how a query works: its result is composed of users that have the same attribute as asked, if that attribute is asked.
fact QueryStructure{
	all ud: UserData, q: Query |
		(ud in q.usersResult
		iff
		((q.groupByPosition = True) implies (q.position = ud.position)) and
		(q.groupByAge = True implies q.age = ud.age) and
		(q.groupByGender = True implies q.gender = ud.gender)
		)
}

//states when a query is returnable (valid) to the TP who asked it. It's returnable if the number of users is at least 3.
fact validQuery{
	all q: Query |
		q.isValid = True iff
		#q.usersResult >= 3
}

/**------------------ASSERTIONS------------------**/

//if a query has no constraint, must return all existing UserDatas
assert GlobalQuery {
	all q:Query |
		(q.groupByPosition = False and q.groupByAge = False and q.groupByGender = False)
		implies
		(all ud:UserData | ud in q.usersResult)
}

/**------------------PREDICATES------------------**/

//show that...
pred showRequest {
	//...at least one user has 2 or more requests but only a part of them accepted, and...
	some r1, r2:Request | r1.user = r2.user and 
		r1.grantedAccess = True and r2.grantedAccess != True
	//...at the same time a TP has at least 2 requests, some accepted and some not
	some r3, r4:Request | r3.thirdParty = r4.thirdParty and 
		r3.grantedAccess = True and r4.grantedAccess != True
}

//show at least a valid query, a non-valid one and a global query, all different ones
pred showQuery {
	some disj q1, q2, q3: Query | 
		//q1 is valid
		(q1.isValid = True) and
		//q2 is not valid
		(q2.isValid = False) and
		//q3 is a global query
		(q3.groupByPosition = False and q3.groupByAge = False and q3.groupByGender = False)
}

check GlobalQuery

run showQuery for 4 but 3 Query, 0 Request, 0 ThirdParty

run showRequest for 4 but 0 Query
