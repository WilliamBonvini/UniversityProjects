package it.polimi.ingsw.model;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.connection.server.util.ClientContainer;
import it.polimi.ingsw.model.factories.BoardFactory;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

public class SetupGameManager {

    public static GameManager setUp () {
        GameManager gm;
        List<AbstractClientHandler> clients = new ArrayList<>();
        RMIClientHandler rmi;
        Table table = new Table();
        for(int i = 0;i < 4;i++)
            try {
                rmi = new RMIClientHandler();
                rmi.setUsername("test" + i);
                clients.add(rmi);
                table.addPlayer("test" + i);
                table.getPlayer("test" + i).assignBoard(BoardFactory.getBoardByID(i + 1));
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        gm = new GameManager(new ClientContainer(clients));

        gm.setTable(table);

        Flow flow = new Flow(gm);
        flow.setupFlow();

        gm.setFlow(flow);

        return gm;
    }
}
