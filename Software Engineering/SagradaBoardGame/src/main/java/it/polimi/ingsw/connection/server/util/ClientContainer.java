package it.polimi.ingsw.connection.server.util;

import it.polimi.ingsw.connection.messages.server.AbstractServerMessage;
import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.exceptions.connection.UserIsOnlineException;
import it.polimi.ingsw.exceptions.connection.UserNotFoundException;

import java.util.*;

/**
 * Container of client handlers. used to abstract from connection and group a specific number of clients
 */
public class ClientContainer {
    private List<AbstractClientHandler> clientHandlers;
    private final int size;

    public ClientContainer(List<AbstractClientHandler> abstractClientHandlerList) {
        clientHandlers = abstractClientHandlerList;
        size = clientHandlers.size();
    }

    /**
     * tells if the user passed is in the game, regardless of the fact it's online or not
     * @param username the name of the user
     * @return true if it's in this container a client handler with the specified username
     */
    public boolean isIn(String username) {
        if (username == null)
            return false;

        for(AbstractClientHandler ach : clientHandlers)
            if(ach.getUsername().equals(username))
                return true;
        return false;
    }


    /**
     *
     * @param username the name of the user searched
     * @return true if the user is in this container and its client handler is online
     * @throws UserNotFoundException if the user is not inside this container
     */
    public boolean isOnline(String username) {
        if(!isIn(username))
            throw new UserNotFoundException();
        for(AbstractClientHandler ach: clientHandlers) {
            if(ach.getUsername().equals(username))
                return ach.isOnline();
        }
        throw new UserNotFoundException();
    }

    /**
     * Replace an existing client handler in this container with a new one, only if it has the same username bound and the one
     * already there in is offline
     * @param newClientHandler the new clienthandler
     * @throws UserNotFoundException if the user is not in this container
     */
    public synchronized void replaceClientHandler(AbstractClientHandler newClientHandler) {
        if(newClientHandler == null || newClientHandler.getUsername() == null || !isIn(newClientHandler.getUsername()))
            throw new UserNotFoundException();

        Optional<AbstractClientHandler> handlerToRemove = Optional.empty();

        for(AbstractClientHandler ach: clientHandlers) {
            //if you found a client handler with the same name
            if (ach.getUsername().equals(newClientHandler.getUsername())) {
                //if it's already online throw exception
                if(ach.isOnline()) {
                    throw new UserIsOnlineException();
                    //if it's not replace it, and notify everyone
                } else {
                    handlerToRemove = Optional.of(ach);
                }
            }
        }

        if(handlerToRemove.isPresent()) {
            clientHandlers.remove(handlerToRemove.get());
            clientHandlers.add(newClientHandler);
        }


    }

    @Override
    public String toString() {
        //if empty, return empty string
        if (clientHandlers.isEmpty())
            return "";
        StringBuilder sb = new StringBuilder("");
        //add every user except the last with post-appended a ',' to separate them
        for (int i = 0; i < clientHandlers.size()-1; i++) {
            sb.append(clientHandlers.get(i).getUsername() + ", ");
        }
        sb.append(clientHandlers.get(clientHandlers.size()-1).getUsername());
        return sb.toString();
    }



    /**
     *
     * @return how many client handlers contained inside this are online
     */
    public int howManyOnline() {
        int count = 0;
        for (AbstractClientHandler ach: clientHandlers) {
            if(ach.isOnline())
                count++;
        }
        return count;
    }

    /**
     * Return the names of all the players in this client container
     * @return the names
     */
    public Set<String> getPlayersNames() {
        Set<String> names = new TreeSet<>();
        for (AbstractClientHandler client : clientHandlers)
            names.add(client.getUsername());
        return names;
    }

    /**
     * @return a set of the names of offline players
     */
    public List<String> getOfflinePlayers() {
        List<String> names = new ArrayList<>();
        for (AbstractClientHandler client : clientHandlers) {
            if(!client.isOnline()) {
                names.add(client.getUsername());
            }
        }
        return names;
    }

    /**
     * @return a set of the names of online players
     */
    public List<String> getOnlinePlayers() {
        List<String> names = new ArrayList<>();
        for (AbstractClientHandler client : clientHandlers) {
            if(client.isOnline()) {
                names.add(client.getUsername());
            }
        }
        return names;
    }


    public int size() {
        return size;
    }


    /**
     * Send a message to a user in this container
     * @param user
     * @param message
     * @throws UserNotFoundException if the user is not found in this container
     */
    public void sendMessageTo(String user, AbstractServerMessage message) {
        for (AbstractClientHandler ach: clientHandlers) {
            if(ach.getUsername().equals(user)) {
                ach.sendMessage(message);
                return;
            }

        }
        throw new UserNotFoundException();
    }


    /**
     * Send a message to all players in this container
     * @param message
     */
    public void sendMessageToAll(AbstractServerMessage message) {
        for(AbstractClientHandler ach: clientHandlers) {
            ach.sendMessage(message);
        }
    }


    /**
     * Send a message to every player in this container, except the specified one
     * @param message
     * @param excludedPlayer
     */
    public void sendMessageToAllExcept(AbstractServerMessage message, String excludedPlayer) {
        for (AbstractClientHandler ach: clientHandlers) {
            if(!ach.getUsername().equals(excludedPlayer)) {
                ach.sendMessage(message);
            }
        }
    }


}
