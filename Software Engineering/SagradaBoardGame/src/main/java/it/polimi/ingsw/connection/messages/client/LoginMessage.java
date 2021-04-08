package it.polimi.ingsw.connection.messages.client;

import it.polimi.ingsw.connection.messages.server.GeneralMessage;
import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.ClientDispatcher;
import it.polimi.ingsw.connection.messages.server.LoginReplyMessage;
import it.polimi.ingsw.utils.Logger;

/**
 * Message which tries to login on server with a username
 */
public class LoginMessage extends AbstractClientMessage {
    private static final String MESSAGETYPE = "login";
    private String username;

    public LoginMessage(String username) {
        super(MESSAGETYPE);
        this.username = username;
    }

    public LoginMessage(){
        super(MESSAGETYPE);
    }

    /**
     * Operation: send a new LoginReplyMessage, which is constructed based on the response from the ClientDispatcher
     * @param ach
     */
    @Override
    public void doOperation(AbstractClientHandler ach) {

        //do operation only if username is valid and the user has not already logged
        if (username!= null && !ach.isLogged()) {

            //check if can login, asking to the Client Dispatcher, and if positive will have set username and logged status (by login method)
            boolean logged = ClientDispatcher.instance().login(username, ach);


            //if it's logged successfully and it's in the waiting lobby, ask for the other players in lobby
            //and send a message to say who's in
            if(logged && ClientDispatcher.instance().isInLobby(username)) {
                ach.sendMessage(new GeneralMessage(inLobbyMessage()));
            }

            //send finally the consequent reply, which also unlocks the client waiting
            ach.sendMessage(new LoginReplyMessage(logged));

        }
        //else log the problem, if the client handler passed is already logged or if the username is null
        else {
            Logger.std().info(username == null ? "username null tried to log" :
                    "User '" + ach.getUsername() + "' is already logged!");
            ach.sendMessage(new LoginReplyMessage(false));
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    /**
     * private method to build the message containing the users already in the lobby when the login is made
     * @return
     */
    private String inLobbyMessage() {
        StringBuilder message = new StringBuilder("");
        //if it's in lobby, ask for who's in to notify who's already in the lobby

        message.append("Utenti in Lobby:");
        for(String s: ClientDispatcher.instance().getUsersInLobby()) {
            message.append("\n" + s);
        }
        return message.toString();
    }

}
