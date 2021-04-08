#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define CHUNK 200
#define MAXPATH 65281 //65280+1

//////////////////////// STRUTTURE ///////////////////////////////////////////////////////////////////////////
typedef struct data{
	char filechunk[200];
	struct data *next;
}data_t;

typedef struct fod {
	char nome[255 + 1]; //nome file o nome cartella
	data_t *f;
	struct fod *figlio[1024];
	struct fod *padre;
	int file; //se 0 e' directory, se 1 e' file
}fod_t;

typedef struct pathlist{
	char path[MAXPATH];
	struct pathlist *next;
}pathlist_t;

typedef struct dir{
	char namedir[256];
	struct dir *next;
}dir_t;

////////////////////////// PROTOTIPI ///////////////////////////////////////////////////////////////////////////

void bubblesort(pathlist_t*);
dir_t *InsTestaDir(dir_t[],char[]);
pathlist_t *InsTestaPath(pathlist_t[], char[]);
void inizializza(char[],fod_t*,fod_t*);
int last_hashvalue(char[],char[],fod_t *);
void create(char[], fod_t*);
fod_t *getdir(char[], fod_t[], int);
int power(int, int);
int hashfoo(fod_t *hashtable[], char nome[]);
void separapercorso(char*, char*);
fod_t *getlastdir(char *percorso, fod_t radice[]);
void create_dir(char percorso[],fod_t radice[]);
void read(char percorso[],fod_t radice[]);
void write(char percorso[], char contenuto[],fod_t radice[]);
int nosons(fod_t*);
void mydelete(char[],fod_t radice[]);
void killprole_commitsuicide(fod_t[]);
void delete_r(char[],fod_t[]);
void buildpath(fod_t*,char[]);
void find(char[], fod_t radice[],pathlist_t*);
int getfunction(void);
char *readchunks(void);



//////////////// INSTESTADIR /////////////////////////////////////////////

dir_t *InsTestaDir(dir_t*h, char contentpiece[]) {
	dir_t *n;
	if (n = (dir_t*)malloc(sizeof(dir_t))) {
		strcpy(n->namedir,contentpiece);	/* importante l'ordine di queste 3 istruzione!*/
		n->next = h;						/* guardo anch'io dove guarda h*/
		h = n;								/* cosÃ¬ l'header di prima non Ã¨ piÃ¹ l'header ma Ã¨ n */
	}else
		printf("InsTestaDir:Errore di Memoria\n");
	return h;
}


////////////// INSTESTAPATH ///////////////////////////////////////////////

pathlist_t *InsTestaPath(pathlist_t*h, char contentpiece[]) {
	pathlist_t *n;
	if (n = (pathlist_t*)malloc(sizeof(pathlist_t))) {
		strcpy(n->path,contentpiece);	/* importante l'ordine di queste 3 istruzione!*/
		n->next = h;						/* guardo anch'io dove guarda h*/
		h = n;								/* cosÃ¬ l'header di prima non Ã¨ piÃ¹ l'header ma Ã¨ n */
	}else
		printf("InsTestaPath:Errore di Memoria\n");
	return h;
}

//////////////////////////////// SEPARAPERCORSO //////////////////////////////////////////////////////
void separapercorso(char percorso[], char nomefile[]) {
	int i, j,arrow; /*,terminator*/
	
	//printf("questo Ã¨ il percorso start%s\n",percorso); giusto
	 
	for (i = 0; percorso[i] != '\0'; i++);			//scorro tutto il percorso fino alla fine.
	
	//printf("dopo il for i dovrebbe valere 4 e vale %d\n",i); //ivale sempre 4, non importa quanti spazi fo
	//printf("il primo carattere letto si chiama %c e il secondo si chiama %c\n",percorso[0],percorso[1]); //sempre /f
	
	while (percorso[i] != '/' )				//torno indietro nella stringa fino allo slash che divide il percorso
		i--;   								// dal nome del file.
//	printf("i dovrebbe valere 0 e vale %d\n",i); // i vale sempre 0 nella prova /foo
	if(i==0)
			arrow=i+1;
	else
		arrow=i;
		
	//printf("arrow e' %d\n",arrow);


	for (i++,j = 0; percorso[j] != '\0'; i++, j++) //salvo in nomefile il nome del file.
		nomefile[j] = percorso[i];
//	printf("i dovrebbe valere 5 e vale %d,j dovrebbe valere 4 e vale %d\n",i,j); //valgono entrambi come dovrebbero valere
	//for(terminator=0;nomefile[terminator]!='\0';terminator++);
	//printf("l'indice del terminatore in nomefile dovrebbe essere 3,in realta' e' %d\n",terminator);// Ã¨ 3, giusto!
	
	percorso[arrow]='\0';	// ora il percorso non include piÃ¹ il nome del file, 
							// ho posto un terminatore al posto dell'ultimo slash
	//printf("il percorso dovrebbe essere /, e invece vale %s\n",percorso);  //giusto!
	
}

/// armando's ////////////
/*int i;
char name[256]
i = (int)name[0];

for (i = 0; i<255 && copia[i + 1] != '\0'; i++)
name[i] = copia[i]

name[i] = copia[i]
name[i] = '\0'*/

/////////////////////////// POTENZA ////////////////////////////////////////////
int power(int base, int exponent) {

	int i, s;
	for (i = 0, s = 1; i < exponent; ++i)
		s *= base;
	return s;
}

/////////////////////////// HASHFOO //////////////////////////////////////////////////////////////////////////
int hashfoo(fod_t * hashtable[], char *nome) { //passo il vettore di hashing //FUNZIONE DI HASHING CHE CERCA TRA I FIGLI INTERNI AL LASTDIR(PADRE), SE NE ESISTE UNO CON NOME UGUALE 
	int hashvalue, i, len; // ALLA STRINGA NOME, ALLORA RESTITUISCE IL SUO INDICE (HASHVALUE). FUNZIONE NON VALIDA PER LA CREAZIONE // DI FILE O DIRECTORY!
	len = strlen(nome) + 1; //salva il numero di caratteri della stringa, incluso il terminatore
	if (len<4)
		for (i = 1; i <= 4 - len; i++)
			nome[len + i] = '\0';
	i = (int)nome[0]; //prende i 4 primi caratteri della stringa e li converte in interi. //sperimento!

	hashvalue = i % 1024; //per ottimizzare il codice prendo in coniderazione gli ultimi 4 caratteri e non i primi 

    //controllo collisioni

	for (i = 1; i<1024 && hashtable[hashvalue] != NULL && strcmp(hashtable[hashvalue]->nome, nome); i++)
		hashvalue = (hashvalue + ((1/2)*i) + ((1/2)*power(i, 2))) % 1024;
	if (i == 1024)
		return -1; //ATTENZIONE, SE HASHTABLE[HASHVALUE] Ãˆ NULL, LA FUNZIONE RITORNA L'HASHVALUE CHE PUNTA A NULL, E DEVO CONTROLLARLO NEL CHIAMANTE, OVVERO GETDIR! FACCIO DOMANI
	printf("hashvalue vale %d",hashvalue);
	return hashvalue;
}
//si ferma o se il nome Ã¨ uguale o se il puntatore a file Ã¨ NULL. poi esternamente controllo se Ã¨ null o meno. se a metÃ  percorso trovo NULL -> percorso sbagliato (dico nel chiamante).

/////////////////////////// GETDIR ///////////////////////////////////////////////////////////////////////////
fod_t *getdir(char percorso[], fod_t *padre, int i) {
	int j, hashvalue;
	char nc[255 + 1];
	
	j=0;
	
	do{           			 //ora salvo in nc il nome della cartella da cercare
		nc[j] = percorso[i];
		i++;
		j++;	
	}while(percorso[i-1] != '/' && percorso[i-1] != '\0');
	
	nc[j] = '\0';
	//printf("la cartella dovrebbe essere foo, invece: %s\n",nc); giusto!
	
	hashvalue = hashfoo(padre->figlio, nc);
	printf("hashvalue dovrebbe valere 102:\n%d\n",hashvalue);
	
	if (hashvalue<0 || padre->figlio[hashvalue] == NULL|| padre->figlio[hashvalue]->file==1) {
		printf("no getdir\n"); //hashtable piena, percorso non esistente, o hai provato ad accedere a un file in mezzo al percorso
		return NULL;
	}

	return padre->figlio[hashvalue];   //ritorna un puntatore a un fod, non nullo, come Ã¨ giusto che sia
}

////////////////////////// GETLASTDIR /////////////////////////////////////////////////////////////////

fod_t *getlastdir(char *percorso, fod_t radice[]) {
	fod_t *current;
	int i, flag;
	current = radice;
	flag = 1;
	
	if (percorso[0] != '/') {
		printf("no\n");				//non dÃ  problemi
		return NULL;
	}
	
	i=1;
	while (flag && i<65280) {
		current = getdir(percorso, current, i);
		while (percorso[i] != '/' && percorso[i] != '\0')
			i++;
		if (current == NULL) //percorso non valido, non faccio ciÃ²:aggiungo la condizione sul flag che mi dice che non sono a fine percorso se mi accorgo che serve, non penso serve, perchÃ© si tratta di accedere alle directory, e nessuna di queste Ã¨ l'ultima, l'ultima si trova in nomefile o nomecartella ;)
			return NULL;

		if (percorso[i] == '\0')
			flag = 0;

	}

	return current;

}

////////////////////////////// INIZIALIZZA /////////////////////////////////////////////////////////

void inizializza(char name[],fod_t *pippo,fod_t *father){
	strcpy(pippo->nome,name);
	int i;
	for(i=0;i<1024;i++)
		pippo->figlio[i]=NULL;
	pippo->f=NULL;
	pippo->padre=father;
}

///////////////////////////////// LAST_HASHVALUE ///////////////////////////////////////////
int last_hashvalue(char percorso[],char nome[],fod_t *pippo){
	int hashvalue;
	//printf("il percorso dovrebbe essere /foo invece: %s\n",percorso); giusto!
	
	if(strlen(percorso)!=1){				//sono giÃ  arrivato all'ultima directory, Ã¨ la radice
		pippo = getlastdir(percorso,pippo);
		if (pippo == NULL) {
			printf("no create_getlastdir poi rimuovo, ne ho due in uno\n");
			return -1;
		}
	}
	hashvalue = hashfoo(pippo->figlio, nome);
	return hashvalue;
}

//////////////////////////////// CREATE //////////////////////////////////////////////////////////////
void create(char percorso[], fod_t radice[]) { //ho deciso io di stampare "no" se il file giÃ  esiste.
	fod_t *lastdir;
	char nomefile[255 + 1];
	int  hashvalue;
	lastdir=radice;
	
	separapercorso(percorso, nomefile);
	hashvalue = last_hashvalue(percorso,nomefile,lastdir);
	
	//Se ottengo lastdirectory->figlio[hashvalue]=NULL Creo la directory
	
	if(lastdir->figlio[hashvalue]==NULL){
		if (lastdir->figlio[hashvalue] = (fod_t*)malloc(sizeof(fod_t))) {
			inizializza(nomefile,lastdir->figlio[hashvalue],lastdir);
			lastdir->figlio[hashvalue]->file=1; // Ã¨ un file
			printf("ok\n");
		}else
			printf("errore allocazione memoria\n");
	}else if(hashvalue < 0 || !strcmp(lastdir->figlio[hashvalue]->nome, nomefile))
				printf("no\n"); //vettore pieno o directory giÃ  esistente
			else
				printf("non dovrebbe mai succedere\n");
	return;
}

///////////////////////////// CREATE_DIR //////////////////////////////////////////////////////////////

void create_dir(char *percorso,fod_t *radice) {  
	char nomecartella[255 + 1];
	fod_t *lastdir;
	int hashvalue;
	lastdir=radice;
	
	separapercorso(percorso, nomecartella);
	
	hashvalue = last_hashvalue(percorso,nomecartella,lastdir);

	//Se ottengo lastdirectory->figlio[hashvalue]=NULL Creo la directory
	if(lastdir->figlio[hashvalue]==NULL){
		if (lastdir->figlio[hashvalue] = (fod_t*)calloc(1,sizeof(fod_t))) {
			inizializza(nomecartella,lastdir->figlio[hashvalue],lastdir);
			lastdir->figlio[hashvalue]=0; // Ã¨ una directory
			printf("ok\n");
		}else
			printf("errore allocazione memoria\n");
	}else if(hashvalue < 0 || strcmp(lastdir->figlio[hashvalue]->nome, nomecartella)==0)
				printf("no\n"); //vettore pieno o directory giÃ  esistente
			else
				printf("non dovrebbe mai succedere\n");
	return;			
	}


/////////////////////////////////// READ ///////////////////////////////////////////////////////////
	void read(char percorso[],fod_t *radice) {
		char nomefile[255 + 1];
		char *content;
		fod_t *lastdir;
		int hashvalue;
		lastdir=radice;

		separapercorso(percorso, nomefile);
		hashvalue = last_hashvalue(percorso,nomefile,lastdir);
	
		if (hashvalue<0 || lastdir->figlio[hashvalue] == NULL) {
			printf("no\n"); //vettore pieno o file non esistente
			return;
		}

		//file giÃ  esistente:
		if (!strcmp(lastdir->figlio[hashvalue]->nome, nomefile)) { //sicuramente Ã¨ cosÃ¬
			printf("contenuto ");
			while(lastdir->figlio[hashvalue]->f->next!=NULL)
				printf("%s",lastdir->figlio[hashvalue]->f->filechunk);
			return;
		}else
			printf("e' una prova, se mi stampa a video vuol dire che ho sbagliato qualcosa\n");
		return;
	}


	//////////////////////////////////// WRITE ///////////////////////

	void write(char percorso[], char contenuto[],fod_t *radice) {

		char nomefile[255 + 1];
		int n, len,count,k,i;
		data_t *temp;
		int hashvalue;
		fod_t *lastdir;
		lastdir=radice;
		
		separapercorso(percorso, nomefile);
		hashvalue = last_hashvalue(percorso,nomefile,lastdir);
		
		if (hashvalue<0 || lastdir->figlio[hashvalue] == NULL) {
			printf("no\n"); //vettore pieno o non esistente
			return;
		}

		//file giÃ  esistente:
		if (!strcmp(lastdir->figlio[hashvalue]->nome, nomefile) && lastdir->figlio[hashvalue]->file==1) { //sicuro la uno, meno sicura la due!
				len = strlen(contenuto);
			count=len;
			k=0;
			for(temp=lastdir->figlio[hashvalue]->f;count>0;temp->next){
				if(temp=(data_t*)malloc(sizeof(data_t))){
					
					for(i=0+(k*200);i<200 && contenuto[i]!='\0';i++)
						temp->filechunk[i]=contenuto[i];
					k++;
					count=count-200;
					
				}else
					printf("no\n");
			}
		}else 
			printf("impossibile accada, lo tengo per garanzia\n");
		return;
	}
	
	////////////////////////////////// NOSONS ///////////////////////////
	
	int nosons(fod_t *pippo){	//restituisce 0 se ha figli, 1 se non ne ha
		int i;
		for(i=0;i<1024;i++)
			if(pippo->figlio[i]!=NULL)
				return 0;
		return 1;
	}


	/////////////////////////////////// MYDELETE ////////////////////////////////////////

	void mydelete(char percorso[],fod_t *radice) {
		char nomefod[255 + 1];
		fod_t *lastdir;
		int hashvalue;
		lastdir=radice;
		
		separapercorso(percorso, nomefod);
		hashvalue = last_hashvalue(percorso,nomefod,lastdir);
		
		if (hashvalue<0 || lastdir->figlio[hashvalue] == NULL)
			printf("no\n"); //vettore pieno o non esistente
		else if (nosons(lastdir->figlio[hashvalue])) { //se non ha figli lo cancello
				free(lastdir->figlio[hashvalue]);
				printf("ok\n");
			}else
			printf("no\n");//la risorsa ha figli, quindi non posso cancellarla.
		return;
	}


	////////////////////////  KILLPROLE_COMMITSUICIDE  //////////////////////////////
	void killprole_commitsuicide(fod_t *pippo) {  //passo il vettore dei figli
		int i;

		for (i = 0; i < 1024; i++)
			if (pippo->figlio[i] != NULL)
				killprole_commitsuicide(pippo->figlio[i]);	
				
		free(pippo);
		return;
	}

	///////////////////////////  DELETE_R //////////////////////////////////////////

	void delete_r(char percorso[],fod_t *radice) {
		char nomefod[255 + 1];
		fod_t *lastdir;
		int hashvalue;
		lastdir=radice;
		
		separapercorso(percorso, nomefod);
		hashvalue = last_hashvalue(percorso,nomefod,lastdir);
		
		//Se il vettore dalla lastdirectory Ã¨ pieno e non puÃ² contenere il nomefod, o se nomefod non esiste esco
		if (hashvalue<0 || lastdir->figlio[hashvalue] == NULL){
			printf("no\n");
			return;
		}
		
		//Se il fod non ha figli faccio la free, se invece ha figli uccide tutti i figli e si suicida
		if(nosons(lastdir->figlio[hashvalue])){
				free(lastdir->figlio[hashvalue]);
				printf("ok\n");
	 	}else{
			killprole_commitsuicide(lastdir->figlio[hashvalue]);
			printf("ok\n");
		}
	}

////////////////////////////////// BUBBLESORT  /////////////////////////////////////////////
void bubblesort(pathlist_t *h){
	pathlist_t *temp1;
	pathlist_t *temp2;
	pathlist_t *aid;
		
	for(temp1=h;temp1; temp1=temp1->next)
		for(temp2=h; temp2->next;temp2=temp2->next)
		
			if(strcmp(temp2->path,temp2->next->path)>0){ //strcmp(1,2)>0 sse 1>2
				aid=temp2->next;
				temp2->next=temp2;
				temp2=aid;  // devo agire anche sul campo path? o basta fare cosÃ¬?
			}
	return;
}

	///////////////////////////////// BUILDPATH  ///////////////////////////////////////////////
	
	void buildpath(fod_t *pippo,char path[]){
		char nomedir[257]; //dimensione cartella piÃ¹ dim '/?
		int dim;
		dir_t *h=NULL;
		dir_t *temp;
		fod_t *current;
		dim=0;
		
		for(current=pippo		;current->padre!=NULL;		current=current->padre){
			
			nomedir[0]='/';					//finchÃ¨ non arrivo alla radice inserisco in una lista i nomi delle
			nomedir[1]='\0';				//cartelle, inserendole in testa. cosÃ¬ le posso stampare ordinate
			strcat(nomedir,current->nome);
			h=InsTestaDir(h,nomedir);
		}
		path[0]='\0';
		for(temp=h;temp;temp=temp->next)
			strcat(path,current->nome);
		return;
	}
	////////////////////FIND///////////////////////////
	void find(char name[], fod_t *radice,pathlist_t *h) {
		int i;
		fod_t *pippo;
		char currentpath[MAXPATH];
		pippo=radice;
		//non controllo se la radice ha lo stesso nome del name passato a find. la radice non ha nome, o sbaglio?
		
		for (i = 0; i < 1024 && pippo->figlio!=NULL; i++){
			if (!strcmp(pippo->figlio[i]->nome, name)){
				buildpath(pippo->figlio[i],currentpath);
				h=InsTestaPath(h,currentpath);
			}
			if(!nosons(pippo))
				find(name,pippo->figlio[i],h);	
		}
		return;
	}

	////////////////// READCHUNKS /////////////////////////////////////

	char* readchunks()
	{
		char* input;
		char tempbuffer[CHUNK];
		int inputlen, templen;
		if (input = (char*)malloc(sizeof(char))) {
			input[0] = '\0';

		}
		else
			printf("errore memoria\n");
		inputlen = 0;
		templen = 0;

		do {
			if (!fgets(tempbuffer, CHUNK, stdin)) {
				printf("errore memoria\n");
				return NULL;
			}
			templen = strlen(tempbuffer);
			inputlen = inputlen + templen;
			input = realloc(input, inputlen + 1);
			strcat(input, tempbuffer);
		} while (templen == CHUNK - 1 && tempbuffer[CHUNK - 2] != '\n');
		return input;
	}

		////////////////////////// GETFUNCTION ////////////////////////////////////

		int getfunction(void) {
		char fname[30];
		int n;
		n = 0;
		while (n<1 || n>8) {
			scanf("%s",fname);
			if (!strcmp(fname, "create"))
				n = 1;
			else if (!strcmp(fname, "create_dir"))
				n = 2;
				else if (!strcmp(fname, "read"))
					n = 3;
					else if (!strcmp(fname, "write"))
						n = 4;
							else if (!strcmp(fname, "delete"))
								n = 5;
									else if (!strcmp(fname, "delete_r"))
										n = 6;
										else if (!strcmp(fname, "find"))
											n = 7;
											else if (!strcmp(fname, "exit"))
												n = 8;
		}
		if(n!=8)
			scanf(" ");
		return n;
	}


	//////////////////////////////////////////// MAIN ////////////////////////////////////

	int main(int argc, char*argv[]) {
		fod_t *radice;
		int caratterifile;
		int scelta;
		char percorso[65280]; //255*255 +255 -> massimo percorso.
		char *contenuto;
		char nome[255];
		pathlist_t *h=NULL;
		pathlist_t *temp;
		int i;
		
		
		//inizializzazione radice:
		
		if(radice=(fod_t*)malloc(sizeof(fod_t))){
			radice->padre == NULL;
			radice->file=0;
			for(i=0;i<1024;i++)
				radice->figlio[i]=NULL;
			radice->f=NULL;
			*(radice->nome)='\0';
	}else{
		printf("errore memoria\n");
		return 0;
	}
		// menu':				//AGGIUNGO CONDIZIONE SULLA LUNGHEZZA DEL PERCORSO! MINORE DI MAXPATH
		scelta = getfunction();
		while (scelta != 8)
			switch (scelta) {
				case 1:
					gets(percorso);
					create(percorso,radice);
					scelta = getfunction();
					break;

				case 2:
					gets(percorso);
					create_dir(percorso,radice);
					scelta = getfunction();
					break;
	
				case 3:
					gets(percorso);
					read(percorso,radice);
					scelta = getfunction();
					break;

				case 4:
					gets(percorso);
					contenuto = readchunks();
					write(percorso, contenuto,radice);
					free(contenuto);
					scelta = getfunction();
					break;

				case 5:
					gets(percorso);
					mydelete(percorso,radice);
					scelta = getfunction();
					break;

				case 6:
					gets(percorso);
					delete_r(percorso,radice);
					scelta = getfunction();
					break;

				case 7:
					gets(percorso);
					find(nome,radice,h);
					bubblesort(h);
					for(temp=h;temp;temp=temp->next)
						printf("%s\n",temp->path);
					scelta = getfunction();
					break;
			}

		return 0;
	}