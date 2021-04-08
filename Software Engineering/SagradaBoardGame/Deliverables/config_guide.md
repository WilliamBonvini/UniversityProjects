i jar sono configurabili tramite file.
In src/main/resources si possono modificare:
  
  globals/game_preferences.json: timeout vari di lobby, turno, ecc.
      
  globals/connection_globals.json: ip, porte, inidirizzi per connessione
  
  boards/boards.json: sono editabili e aggiungibili nuove board, come F.A.
  
  logs/logger_std_config.json:  modifiche al logger, come filterLevel (0 a 5), o se abilitare i colori


LINEA DI COMANDO - Client:
  -i per avere info sui comandi da linea di comando
  -u <cli/gui> per far partire il client in una delle due modalità
  -c <rmi/socket> per scegliere in anticipo la modalità di connessione
  -i <indirizzo ip> per scegliere l'indirizzo IP
  -n <nickname> per scegliere prima il nickname
