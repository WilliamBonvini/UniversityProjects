package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.connection.client.AbstractServerHandler;
import it.polimi.ingsw.connection.client.ConnectionManager;

/**
 * Reply message for a login attempt, either if successful or not
 */
public class LoginReplyMessage extends AbstractServerMessage {
    private String access;
    private static final String MESSAGE_TYPE = "reply_login";
    private static final String GRANTED = "granted";
    private static final String DENIED = "denied";


    public LoginReplyMessage(boolean loginOk) {
        super(MESSAGE_TYPE);
        if(loginOk)
            access = GRANTED;
        else
            access = DENIED;
    }

    public LoginReplyMessage(){
        super(MESSAGE_TYPE);
    }

    @Override
    public void doOperation(AbstractServerHandler ash) {
        ConnectionManager.instance().setWaitForAnswer(false);
        //if is not granted
        if(access == null || access.equals(DENIED) || !access.equals(GRANTED)) {
            //do nothing
        } else {
            //set the logged variable to true
            ConnectionManager.instance().setLogged(true);
        }
    }
}
