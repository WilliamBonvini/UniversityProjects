package it.polimi.ingsw.connection.messages.client;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.connection.client.SocketServerHandler;
import it.polimi.ingsw.connection.messages.server.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Dispatcher for messages sent via socket. De-serialize the message and do the operation associated with it
 */
public class ClientSocketMessageDispatcher {
    private SocketServerHandler socketServerHandler;
    private Map<String, Class<? extends AbstractServerMessage>> messageOperationMap;

    public ClientSocketMessageDispatcher(SocketServerHandler socketServerHandler) {
        this.socketServerHandler = socketServerHandler;
        messageOperationMap = new HashMap<>();

        //add the operations
        AbstractServerMessage serverMessage = new LoginReplyMessage();
        messageOperationMap.put(serverMessage.getType(), serverMessage.getClass());

        serverMessage = new GeneralMessage("");
        messageOperationMap.put(serverMessage.getType(), serverMessage.getClass());

        serverMessage = new ChooseBoardMessage();
        messageOperationMap.put(serverMessage.getType(), serverMessage.getClass());

        serverMessage = new SetupMessage();
        messageOperationMap.put(serverMessage.getType(), serverMessage.getClass());

        serverMessage = new ChangedModelMessage();
        messageOperationMap.put(serverMessage.getType(), serverMessage.getClass());

        serverMessage = new GameEndedMessage();
        messageOperationMap.put(serverMessage.getType(), serverMessage.getClass());
    }

    /**
     * parse a json in a server message and do its operation
     * @param json the string used to de-serialize the message
     */
    public void parseAndOperate(String json) {
        Gson gson = new GsonBuilder().create();
        try {
            TypeOfMessage type = gson.fromJson(json, TypeOfMessage.class);
            //if contains the type passed, then do its operation
            if (type!= null && type.getType()!= null && messageOperationMap.containsKey(type.getType())) {
                //retrieve the message based on the type, from the hashmap and
                //load the message in an instance, and do its operation
                parseServerMessage(messageOperationMap.get(type.getType()), json)
                        .doOperation(socketServerHandler);
            }

        } catch (JsonSyntaxException jsse) {
            //do nothing
        }

    }

    /**
     * Parse a json String in a class, which implements AbstractClientMessage
     * @param serverMessageClass the instance class
     * @param jsonMessage the String source
     * @return a
     */
    private AbstractServerMessage parseServerMessage(Class<? extends AbstractServerMessage> serverMessageClass, String jsonMessage) {
        Gson gson = new GsonBuilder().create();
        return gson.fromJson(jsonMessage, serverMessageClass);
    }

    private class TypeOfMessage {
        private String type;

        public String getType() {
            return type;
        }
    }


}
