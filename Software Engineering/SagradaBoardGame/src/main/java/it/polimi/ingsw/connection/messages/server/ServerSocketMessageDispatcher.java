package it.polimi.ingsw.connection.messages.server;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.connection.messages.client.*;
import it.polimi.ingsw.connection.server.clienthandlers.SocketClientHandler;

import java.util.HashMap;
import java.util.Map;

/**
 * Dispatcher for Client Messages. De-serialize them and do the operation associated with them
 */
public class ServerSocketMessageDispatcher {
    private SocketClientHandler socketClientHandler;
    private Map<String, Class<? extends AbstractClientMessage>> messageOperationMap;

    public ServerSocketMessageDispatcher(SocketClientHandler socketClientHandler) {
        this.socketClientHandler = socketClientHandler;
        messageOperationMap = new HashMap<>();

        //add the operations
        AbstractClientMessage clientMessage = new LoginMessage();
        messageOperationMap.put(clientMessage.getType(), clientMessage.getClass());

        clientMessage = new QuitMessage();
        messageOperationMap.put(clientMessage.getType(), clientMessage.getClass());

        clientMessage = new ChooseBoardReplyMessage();
        messageOperationMap.put(clientMessage.getType(), clientMessage.getClass());

        clientMessage = new SelectedMessage();
        messageOperationMap.put(clientMessage.getType(), clientMessage.getClass());

    }

    /**
     * parse the json in a ClientMessage and do the operation associated
     * @param json the string of the serialized message
     */
    public void parseAndOperate(String json) {
        Gson gson = new GsonBuilder().create();
        try {
            TypeOfMessage type = gson.fromJson(json, TypeOfMessage.class);
            //if contains the type passed, then do its operation
            if (type!= null && type.getType()!= null && messageOperationMap.containsKey(type.getType())) {
                //retrieve the message based on the type, from the hashmap and
                //load the message in an instance, and do its operation
                parseClientMessage(messageOperationMap.get(type.getType()), json)
                        .doOperation(socketClientHandler);
            }

        } catch (JsonSyntaxException jsse) {
            //do nothing
        }

    }

    /**
     * Parse a json String in a class, which implements AbstractClientMessage
     * @param clientMessageClass the instance class
     * @param jsonMessage the String source
     * @return a
     */
    private AbstractClientMessage parseClientMessage(Class<? extends AbstractClientMessage> clientMessageClass, String jsonMessage) {
        Gson gson = new GsonBuilder().create();
        return gson.fromJson(jsonMessage, clientMessageClass);
    }


    public SocketClientHandler getSocketClientHandler() {
        return socketClientHandler;
    }

    private class TypeOfMessage {
        private String type;

        public String getType() {
            return type;
        }
    }



}
