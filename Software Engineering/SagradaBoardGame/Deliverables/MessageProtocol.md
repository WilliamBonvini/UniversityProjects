The ClientMain class from the Client handles the comunication with the Server.
The ClientHandlerSocket class from the Server handles the comunication with the clients.



## Login:

| Client                                          | Server                                                    |
| ----------------------------------------------- | --------------------------------------------------------- |
| { "type" : "login","name": "actualusername"} |                                                           |
|                                                 | { "type" : "reply_login","access": <"granted"><"denied">}                                                                             |                      


## Quitting:

| Client             | Server      |
| -------------------| ----------- |
| { "type" : "quit"} |             |



## Message:

| Client        | Server                             |
|-------------- | ---------------------------------- |
|               | {"type":"message","actualmessage"} |

This message is sent by the server to the client whenever the server wants the client to display an information on the side screen of the UI.  
It can be received before the beginning of the game, during the game, and after.
examples of information are:   
  
*Before the beginning of the game*:
- the server notifies the player who are the players he is going to play with (the ones in the lobby)
- "                            " that a new player has just entered the lobby.
- "                            " that a player has just left the lobby.
- "                            " how many seconds are left for the beginning of the game
- "                            " that, since a player has left the lobby, the timer interrupts.

*During the game*:
- the server communicates to the client the records of the game
- "                                   " a player has left the game

*After the the game*:
- the server communicates to the server the points of each player, their rank in the game, their rank in the match.    

## Choose Board and Choose Board Reply  
| Client | Server |
|--------|--------|
|        | {"type":"choose_board", "boards":[2,4,11,17]} |
| {"type":"reply_choose_board", "board":"1-4"} | |
  
The server asks to the client to choose one board out of 4 (the numbers 2,4,11,17 have been put for demo purposes, each of them identifies a specific board in Sagrada).  
The client answers with the chosen board.
The "choose_board" message states the beginning of the game

  
## Setup  
| Client | Server |
|--------|--------|
|        | {"type":"setup", "playerBoardCouple":  [ {"t":"playerName", "e":"numBoard"},{"t":"playerName", "e":"numBoard"}, {"t":"playerName", "e":"numBoard"},{"t":"playerName", "e":"numBoard"}], "tools":["idTool1","idTool2","idTool3"], "publicObjectives":["idPO1","idPO2","idPO3"], "privateObjective":"numPrivObj", "firstPlayer":"actualPlayerName"} |  
  
The server gives to the client all the needed information of each player:  
- The links between a player's name and the board he has chosen  
- The three shared Tool cards  
- The three shared Public Objective cards  
- The single Private Objective card of the client  
- The name of the first player of the game  

## Records:  
| Client     | Server |
|------------|----------------------------------------------------------------------------------|
|{"type":"records"}|  |  
|            | {"type":"reply_records", "records":[{"username":"actual_name","score":"12345"}]}|  
  
The clients asks the records of the match and the server answers with a ranking containing the names of the players and their total score 
  

## Selected:
| Client                                                                      | Server              |   
| ----------------------------------------------------------------------------| ------------------- |  
| {"type":"selected","component":"actualcomponent","idview":"actualidview"}   |                     |    

## ChangedModel:  
| Client   | Server |
| -------- | -------------------------------------------------------------------------|
|          | {"type":"change","playerAndBoardCouples":[actual_couples],"playersFavours":[{"user1",3}],"toolFavours":[1,3,4],"pool":[actual_pool],"roundtrack":[actual_roundtrack],"currentPlayerHand":[actual_player_hand], "bagOwner":"actual_bag_owner","currentPlayer":"actual_current_player", "choiceID": "123"} |   

*Explanation of selected and changed*:     
**selected**: the client selects components and actions to be performed by the server.   
**changed**: the server changes components in each client's view.   
**actualcomponent** is any graphical component of the view:     
"roundtrack"    
"pool"     
"curr"    
"board"   
"choose"   
"restriction"  
...  
**actualidview** is an id that identifies a button on the view and more importantly a series of actions that will be performed on the server side by the controller. 
i.e. if the user has to position a die on the board, he can click on a button of the component board, and the client sends the idview to the server: type:selected, component:board, idview: 5 (the 5th cell of the Board).
The server knows that the user wants to put the die on that cell, because it's the event that will trigger the beginning of the next operation.

  
## Choose and Choose Reply   
| Client | Server |
|--------|--------|
|        |{"type":"choose", "question":"actualQuestion", "options":["option1", "option2"...]}|
|{"type":"reply_choose", "choice":"1-n"}| |
  
Anytime the server wants the client to choose between some options it sends a "choose" message.  
The client answers with the chosen option




## EndGame  
|Client | Server |
|-------|--------|
|       |{"type":"game_ended"}|
                

