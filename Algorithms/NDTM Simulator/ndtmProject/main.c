

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/**
 * Typedefs
 */


#define NLETTERS 4096

typedef struct sDimensionDispenser{
    int numberOfStates;
    int numberOfCharacters;
}dimensionDispenser;



typedef struct sTape
{
    char letter[NLETTERS];
    int leftBound;
    int rightBound;
    struct sTape *previous;
    struct sTape *next;
}tape;

/**
 * Such type is needed to store all the transitions in a temporary list, whose purpose is just to save such data
 * and mainly count the elements to store them afterwards in a matrix[stateOne][read] whose size fits exactly the size needed by the TM
 */
typedef struct sTransitionElement{
    int stateOne;
    char read;
    char write;
    char move;
    int stateTwo;
    struct sTransitionElement*next;
}transitionElement;



typedef struct sInstruction{
    char write;
    char moveTo;
    int goTo;
    int exist;
    struct sInstruction *next;
}instruction;


typedef struct sAcceptanceState{
    int state;
    struct sAcceptanceState *next;
}acceptanceState;



typedef struct path{
    int state;
    long height;
    int tapeHead;
    tape *tmTape;
    struct path *next;
}path;


typedef struct sQueueOfPaths{
    struct path *front;
    struct path *rear;
}queueOfPaths;



/**
 * waitingRoom:
 * a small function which stops the main functio from running until the user presses "enter"
 */
void waitingRoom(){
    while(getchar()!='\n') {
        //do nothing
    }
}



/**
 * insTestaInstrList:
 *
 * @param old
 * @param instr
 * @return
 */

instruction *insTestaInstrList(instruction *old, instruction instr) {
    instruction *current;
    if(old->exist){
        current = (instruction*)malloc(sizeof(instruction));
        current->write = instr.write;
        current->moveTo = instr.moveTo;
        current->goTo = instr.goTo;
        current->exist = 1;
        current->next = old;
        return current;

    }else{
        old->exist = 1;
        old->write = instr.write;
        old->moveTo = instr.moveTo;
        old->goTo = instr.goTo;
        old->next = NULL;
        return old;
    }
}



/**
 * insTestaTransition:
 *
 * @param old
 * @param instr
 * @return
 */
transitionElement *insTestaTransition(transitionElement *old, transitionElement info) {
    transitionElement *new;
    new = (transitionElement*)malloc(sizeof(transitionElement));
    new->stateOne = info.stateOne;
    new->read = info.read;
    new->write = info.write;
    new->move = info.move;
    new->stateTwo = info.stateTwo;
    new->next = old;
    old = new;

    return old;
}

/**
 * insTestaAcceptanceState:
 *
 * @param old
 * @param state
 * @return
 */
acceptanceState *insTestaAcceptanceState(acceptanceState *old, int state) {
    acceptanceState *new;
    new = (acceptanceState*)malloc(sizeof(acceptanceState));
    new->state = state;
    new->next = old;
    old = new;

    return old;
}



/**
 * cleanTape:
 * this functions deletes all the nodes in the tape the first one includes, exactly the same function of deleteTape, no differences
 * IMPORTANT - THIS FUNCTION IS USED EVEN BY emptyQueue SO IT HAS TO DO SUCH JOB, IN CASE YOU CHANGE YOUR MIND AND WANT JUST TO CLEAN
 * THE TAPE THINK ABOUT THIS!
 * @param input: the tape to be cleaned
 * @return the head of the tape
 */
void cleanTape(tape *input){

    if(input){

        tape *tempTape,*core,*forward,*backward;

        /** core references the node of the tape that has been passed as a parameter **/
        core = input;

        /** forward references the next node from the core **/
        forward = core->next; //I don't want to delete the first cell of the tape (the core)
        while(forward){
            tempTape=forward->next;
            free(forward);
            forward = tempTape;
        }

        /** backward references the previous node from the core **/
        backward = core->previous; // I don't want to delete the first cell of the tape here as well
        while(backward){
            tempTape = backward->previous;
            free(backward);
            backward = tempTape;
        }

        /** In the end, deletes the core **/
        free(core);

    }

}



/**
 * getNumberOfStates:
 * Needed to allocate the right amount of memory for the hash structure which will contain the transitions.
 * @param h: the list of transitions which contains the initial state, the arrival state, and the write,read,move characters
 * @param letterToIndexConverter: a vector of chars which will be used to access the right index in the matrix regarding the characters read
 * @return the number of states of such lists
 */
int getNumberOfStates(transitionElement *h, int *letterToIndexConverter){
    int numberOfStates;
    int letterIndex = 0;
    int maxState = 0;


    while(h) {

        // Counting number of states
        if (h->stateOne >= maxState)
            maxState = h->stateOne;

        if (h->stateTwo >= maxState)
            maxState = h->stateTwo;


        //Filling the letterToIndexConverter vector
        if(letterToIndexConverter[(int)h->read] == -1) {
            letterToIndexConverter[(int) h->read] = letterIndex;
            letterIndex++;
        }

        if(letterToIndexConverter[(int)h->write] == -1) {
            letterToIndexConverter[(int) h->write] = letterIndex;
            letterIndex++;
        }

        h = h->next;
    }
    numberOfStates = maxState + 1;
    return numberOfStates;
}


/**
 *
 * @param letterToIndexConverter
 * @return
 */
int getNumberOfChars(int *letterToIndexConverter){
    int max = 0;
    for (int i = 0; i < 128; i++) {
        if(letterToIndexConverter[i]>max){
            max = letterToIndexConverter[i];
        }
    }
    return (max + 1);
}


/**
 * saveData:
 * this function saves the meaningful information needed to simulate the TM.
 * These info are: the transition function, the acceptance states, the maximum number of computations
 * @param transElement:
 * @param letterToIndexConverter: a vector of ints which indexes correspond to the ASCII number of the letter written by the TM, and the int contained at such index is the index of the matrix of instructionLists which points to the line where such read character is the one read.
 * @param accStates: a list of ints which represents the acceptance states of such TM
 * @param max : the maximum number of computation operated by such TM
 * @param dimDispenser: a struct that contains the number of states and number of characters read from the input. this info is needed to allocate, after the execution of
 *                      such function, the needed space in the matrix of instructionLists called trHashTable
 */
transitionElement *saveData(int *letterToIndexConverter, acceptanceState **accStates, long *max,dimensionDispenser* dimDispenser){
    int exit,numberOfStates,numberOfChars;
    transitionElement *transElementList = NULL;
    transitionElement tempTransition;

    waitingRoom();

    //transition function
    exit = 0;
    /*
     * This while loop temporary stores the transitions, which will be stored in the size-fitting structure right after.
     */
    while (!exit) {
        if (!scanf("%d", &(tempTransition.stateOne))) {
            exit = 1;
        }
        else {
            int flag = 0;
            while(!flag){
                scanf("%c", &(tempTransition.read));
                if(tempTransition.read!=(' ')){
                    flag = 1;
                }
            }
            flag = 0;
            while(!flag){
                scanf("%c", &(tempTransition.write));
                if(tempTransition.write!=(' ')){
                    flag = 1;
                }
            }
            flag = 0;
            while(!flag){
                scanf("%c", &(tempTransition.move));
                if(tempTransition.move!=(' ')){
                    flag = 1;
                }
            }
            flag = 0;
            scanf("%d", &(tempTransition.stateTwo));


            transElementList = insTestaTransition(transElementList,tempTransition);
        }
    }

    numberOfStates = getNumberOfStates(transElementList,letterToIndexConverter);
    numberOfChars = getNumberOfChars(letterToIndexConverter);
    dimDispenser->numberOfCharacters = numberOfChars;
    dimDispenser->numberOfStates = numberOfStates;
    waitingRoom();

    //acceptance states
    exit = 0;
    int tempAcceptanceState;
    while (!exit) {
        if (!scanf("%d", &tempAcceptanceState))
            exit = 1;
        else {
            *accStates = insTestaAcceptanceState(*accStates, tempAcceptanceState);
        }
    }
    waitingRoom();

    scanf("%ld", max);


    waitingRoom();
    waitingRoom();

    return transElementList;
}



/**
 *
 * @param h
 */
void emptyInstructionList(instruction *h) {
    instruction *temp;
    while (h) {
        temp = h;
        h = h->next;
        free(temp);
    }
}


/**
 *
 */
void emptyAcceptanceStateList(acceptanceState *h) {
    acceptanceState *temp;
    while (h) {
        temp = h;
        h = h->next;
        free(temp);
    }
}


/**
 *
 * @param h
 */
void emptyTransitionElementList(transitionElement *h){
    transitionElement *temp;
    while(h){
        temp = h->next;
        free(h);
        h=temp;
    }
}



/**
 *
 * @param h
 */
void emptyQueue(queueOfPaths *q){
    path *h = q->front;
    path *temp;
    while(h){
        temp = h;
        h = h->next;
        cleanTape(temp->tmTape);
        free(temp);
    }
}





/**
 * pop:
 *
 * @param head
 * @return
 */
path *deQueue(queueOfPaths *queue){
    if(queue->front == NULL) {
        return NULL;
    }
    path *temp = queue->front;
    queue->front = queue->front->next;

    temp->next = NULL; // it's important that the dequeued path does does not contain the reference to the next path

    if(queue->front == NULL) {
        queue->rear = NULL;
    }
    return temp;
}


/**
 * enQueue:
 *
 * @param queue
 * @param newPath
 */
void enQueue(queueOfPaths *queue, path *newPath){
    if (queue->rear == NULL) {
        queue->front = newPath;
        queue->rear = newPath;
        return;
    }
    queue->rear->next = newPath;
    queue->rear = newPath;
}



tape *insTestaTapeChunk(tape *h, tape *oldTape) {
    tape *new;
    new = (tape*)malloc(sizeof(tape));
    for(int i=0;i<NLETTERS;i++){
        new->letter[i]=oldTape->letter[i];
    }
    new->leftBound = oldTape->leftBound;
    new->rightBound = oldTape->rightBound;

    new->next = h;
    h->previous = new;
    new->previous = NULL;
    h = new;

    return h;
}

/**
 *
 */
tape *insCodaTapeChunk(tape* newTape,tape* oldTape){
    tape *temp, *n;
    n = (tape*)malloc(sizeof(tape));

    for(int i=0;i<NLETTERS;i++){
        n->letter[i]=oldTape->letter[i];
    }
    n->rightBound = oldTape->rightBound;
    n->leftBound = oldTape->leftBound;
    n->next = NULL;

    if(!newTape){
        n->previous = NULL;
        newTape = n;
    }else{
        for(temp=newTape;temp->next;temp=temp->next)
            ;
        temp->next = n;
        n->previous = temp;
    }
    return newTape;
}



/**
 * copyTape:
 * This function copies the tape of a TM in a new tape, and returns the head of such new tape.
 * it's been declared an int (index), and when such int satisfies the condition to be equal to the
 * index of the oldInputHead, triggers the function to save the reference of the node of the list reached.
 * @param tempPath: the path from which the inputChar list will be taken
 * @param tapeIndex: the pointer which points to the inputChar indexed by the tapeHead of the new inputChar list
 * @return the head of the new list, which is the copy of the one contained in the tempPath
 */
inline static tape *copyTape(tape *oldTape, tape *newTape){
    tape *oldHead,*newHead;
    oldHead = oldTape;


    for(    ;   oldTape;    oldTape = oldTape->next)
        newTape = insCodaTapeChunk(newTape,oldTape);

    newHead = newTape; // this line of code must be put here, because, in case I put it before the for loop, newHead would point to NULL

    if(oldHead ->previous == NULL){
        newHead->previous = NULL;
        return newHead;
    }

    oldTape = oldHead->previous;

    for(    ;   oldTape;    oldTape = oldTape->previous)
        newTape = insTestaTapeChunk(newTape,oldTape);


    newTape = newHead;

    return newTape;
}




/**
 * copyPath:
 *
 * @param oldPath
 * @param newPath
 */
inline static void copyPath(path *oldPath, path *newPath){
    newPath->state = oldPath->state; // Copies the state the oldTM is in
    newPath->height = oldPath->height; // Copies the number of computations of the old TM in the new one
    newPath->tapeHead =  oldPath->tapeHead; // Copies the index of the tape of the old TM in the new one
    //Copies old's TM's tape into new TM's tape
    newPath->tmTape = copyTape(oldPath->tmTape,newPath->tmTape);
}


/**
 *
 * @param currentPath
 * @param currentInstruction
 * @param max
 * @return 0 usually
 *         2 if the maximum number of computations has been reached
 *         3 if a loop has been found -> communicates t the program that if the queue gets emptied it must return U, not 0.
 */
int executeOperations(path* currentPath, instruction* currentInstruction, long max){

    int tHead = currentPath->tapeHead;


    /** Loop control **/
    if(currentPath->tmTape->letter[tHead] == currentInstruction->write && currentPath->state == currentInstruction->moveTo && currentInstruction->moveTo == 'S'){
        return 3; // I free the path in the caller, I use the number 3 to communicate to the program that one of the paths is a loop and that if the queue is emptied, it must return U, not 0.
    }

    /**EXECUTES THE TM OPERATIONS **/
    currentPath->tmTape->letter[tHead] = currentInstruction->write; //Writes the write character in the position of the read character

    /** Increases the number of computations of the tm **/
    (currentPath->height)++;

    if(currentPath->height == max)
        return 2;

    if(currentInstruction->moveTo == 'R'){
        /** Move right **/

        if(currentPath->tapeHead < NLETTERS - 1){
            /** NOT at the right edge of the tape **/

            (currentPath->tapeHead)++;

            if(currentPath->tapeHead == currentPath->tmTape->rightBound + 1){
                /** exceeded right bound **/

                currentPath->tmTape->letter[currentPath->tapeHead] = '_';
                currentPath->tmTape->rightBound ++;
            }

        }else{
            /** At the right edge of the tape **/

            currentPath->tapeHead = 0;

            if(currentPath->tmTape->next == NULL) {
                /** next element does not exist **/

                currentPath->tmTape->next = (tape *) malloc(sizeof(tape));
                currentPath->tmTape->next->rightBound = 0;
                currentPath->tmTape->next->leftBound = 0;
                currentPath->tmTape->next->letter[0] = '_';
                currentPath->tmTape->next->next = NULL;
                currentPath->tmTape->next->previous = NULL;
            }

            tape *tempA;
            tempA = currentPath->tmTape;
            currentPath->tmTape = currentPath->tmTape->next;
            currentPath->tmTape->previous = tempA;

        }

    }else if(currentInstruction->moveTo == 'L'){
        /** Move left **/

        if(currentPath->tapeHead > 0){
            /** NOT at the left edge of the tape **/

            (currentPath->tapeHead)--;

            if(currentPath->tapeHead == currentPath->tmTape->leftBound - 1){
                /** exceeded left bound **/

                currentPath->tmTape->letter[currentPath->tapeHead] = '_';
                currentPath->tmTape->leftBound --;
            }

        }else{
            /** At the left edge of the tape **/

            currentPath->tapeHead = NLETTERS - 1 ;

            if(currentPath->tmTape->previous == NULL) {
                /** previous element does not exist **/

                currentPath->tmTape->previous = (tape *)malloc(sizeof(tape));
                currentPath->tmTape->previous->rightBound = NLETTERS - 1;
                currentPath->tmTape->previous->leftBound =  NLETTERS - 1;
                currentPath->tmTape->previous->letter[NLETTERS - 1] = '_';
                currentPath->tmTape->previous->previous = NULL;
                currentPath->tmTape->previous->next = NULL;
            }

            tape *tempB;
            tempB = currentPath->tmTape;
            currentPath->tmTape = currentPath->tmTape->previous;
            currentPath->tmTape->next = tempB;

        }
    }


    currentPath->state = currentInstruction->goTo; //Goes to the new state

    return 0;
}



/**
 * found:
 * @param state: the state I want to check if it's an acceptance state or not
 * @param acceptStates the list of the acceptance states of the TM
 * @return 0 if state is not an acceptance state, 1 if state is an acceptance state
 */
inline static int found(int state,acceptanceState *h){
    acceptanceState *temp;
    temp = h;
    while(temp) {
        if (temp->state == state)
            return 1;
        temp = temp->next;
    }
    return 0;
}



/**
 * updateOrCreatePath:
 * In case the touring machine (tempPath) is able to go in a new state, such tm is updated with the write character, new state and new tapeHead index.
 * The updated path is then enqueued in the queue by calling the enqueuePath function.
 * In case the tm isn't able to go in any new state it's not enqueued.
 *
 * @param tail: the tail of the queue of paths
 * @param tempPath: the representation of a tm's current situation
 * @param nCharacters: the number of characters read and written by the transition function
 * @param trHashTable: the representation of the instructions executed by each tm
 * @param letterToIndexConverter: a vector if ints that is needed to convert a letter in a index of the trHashTable vector of pointers
 */
inline static int updateOrCreatePath(queueOfPaths *queue,path *tmPath,int nCharacters,instruction **trHashTable,int *letterToIndexConverter, acceptanceState *accStates, long max) {
    instruction *ndInstruction;
    instruction *dInstruction;
    path *currentPath = NULL;
    int initialState = tmPath->state;
    int initialTapeHead = tmPath->tapeHead;

    int j = letterToIndexConverter[(int) tmPath->tmTape->letter[initialTapeHead]];
    if(j<0){
        /** such character is not contained in the transitions function so no transition can be performed **/
        if(found(tmPath->state,accStates)){
            /** if it's an acceptance state I delete it and return 1 **/
            cleanTape(tmPath->tmTape);
            free(tmPath);
            emptyQueue(queue);
            return 1;
        }else if(tmPath->height >= max){
            /** Otherwise if the number of computations is equal to the max number of computations I delete it and return 2 **/
            cleanTape(tmPath->tmTape);
            free(tmPath);
            emptyQueue(queue);
            return 2;
        }
        /** Otherwise I delete it and analyze the next path of the queue **/
        cleanTape(tmPath->tmTape);
        free(tmPath);
        return -1;
    }
    
    int n = initialState * nCharacters + j;

    /** the first instruction is the deterministic one, the other ones are the non - deterministic ones **/
    dInstruction = trHashTable[n];
    ndInstruction = dInstruction->next;

    /** such combination of initial state and read character does not correspond to any instruction **/
    if (dInstruction->exist == 0) {
        /** But this is an acceptance state! **/
        if(found(tmPath->state,accStates)){
            cleanTape(tmPath->tmTape);
            free(tmPath);
            emptyQueue(queue);
            return 1;
        }else if(tmPath->height == max) {
            /** Otherwise if the number of computations is equal to the max number of computations I delete it and return 2 **/
            cleanTape(tmPath->tmTape);
            free(tmPath);
            emptyQueue(queue);
            return 2;
        }

        /** Not an accepetance state, nor nc>max, so I delete it and analyze the next path of the queue **/
        cleanTape(tmPath->tmTape);
        free(tmPath);
        return -1;
    }

    int isU;
    while (ndInstruction) {

        currentPath = (path *) malloc(sizeof(path));
        currentPath->next = NULL;
        currentPath->tmTape = NULL;
        copyPath(tmPath,currentPath);
        isU = executeOperations(currentPath, ndInstruction,max);
        if(isU == 2){
            cleanTape(tmPath->tmTape);
            free(tmPath);
            emptyQueue(queue);
            return 2;
        }else if(isU == 3){
            cleanTape(tmPath->tmTape);
            free(tmPath);
            return 3;
        }
        enQueue(queue, currentPath);
        ndInstruction = ndInstruction->next;
    }


    isU = executeOperations(tmPath,dInstruction,max);
    if(isU == 2){
        cleanTape(tmPath->tmTape);
        free(tmPath);
        emptyQueue(queue);
        return 2;
    }else if(isU == 3){
        cleanTape(tmPath->tmTape);
        free(tmPath);
        return 3;
    }

    enQueue(queue,tmPath);

    return -1;
}



/**
 * compute:
 * Computes the output for a particular string
 * @param trHashTable: the hashtable containing the transition function
 * @param accStates: the acceptance states of the TM
 * @param max: the maximum number of computation performed by such TM
 * @param input: the string inputted in such TM
 * @return the output returned by the TM
 */
void compute(int nCharacters, instruction **trHashTable,acceptanceState *accStates, long max, tape *rootTape,int *letterToIndexConverter){
    path *rootPath = (path*)malloc(sizeof(path));
    path *pathWhoseTurnIs = NULL;
    queueOfPaths *queue = (queueOfPaths*)calloc(1,sizeof(queueOfPaths));
    int reachedAcceptanceState, isU = 0;

    rootPath->tmTape = rootTape;
    rootPath->tapeHead = 0;
    rootPath->height = 0; //number of computations
    rootPath->state = 0;
    rootPath->next = NULL;

    enQueue(queue,rootPath);

    while( queue != NULL && queue->front!=NULL && queue->rear!=NULL) {

        pathWhoseTurnIs = deQueue(queue);
        reachedAcceptanceState = updateOrCreatePath(queue, pathWhoseTurnIs, nCharacters, trHashTable, letterToIndexConverter, accStates, max);

        switch (reachedAcceptanceState){
            case 1:
                printf("1\n");
                return;
            case 2:
                printf("U\n");
                return;
            case 3:
                isU = 1;
            default:
                break;
        }
    }

    if(isU){
        printf("U\n");
    }else{
        printf("0\n");
    }

}




/**
 * Main function
 */
int main() {

    /** Declarations **/
    int letterToIndexConverter[128];
    acceptanceState *accStates = NULL;
    int nStates, nCharacters;
    long max;
    dimensionDispenser dimDispenser;
    transitionElement *transitionElem = NULL;
    tape *tmTape;

    /** Initializations:  **/
    for (int i = 0; i < 128; i++) {
        letterToIndexConverter[i] = -1;
    }



    transitionElem = saveData(letterToIndexConverter, &accStates, &max, &dimDispenser);
    //printf("0\n");
    //return 0;
    nStates = dimDispenser.numberOfStates;
    nCharacters = dimDispenser.numberOfCharacters;

    //Allocates the memory for the hashTable
    int dim = nStates * nCharacters;
    instruction  *trHashTable[dim];
    for (int i = 0; i < nStates; i++) {
        for (int j = 0; j < nCharacters; j++) {
            int n = i * nCharacters + j;
            trHashTable[n]=(instruction*)malloc(sizeof(instruction));
            trHashTable[n]->exist = 0;
            trHashTable[n]->next = NULL;
        }
    }


    // Copies the transitions saved in the temporary list made by transition elements in the matrix of instructions
    instruction tempInstruction;
    transitionElement *trElemHead = transitionElem;
    for(; transitionElem;transitionElem = transitionElem->next){
        tempInstruction.write = transitionElem->write;
        tempInstruction.goTo = transitionElem->stateTwo;
        tempInstruction.moveTo = transitionElem->move;
        int i = transitionElem->stateOne;
        int aIndex = (int)transitionElem->read;
        int j = letterToIndexConverter[aIndex];
        int n = i*nCharacters + j;
        trHashTable[n] = insTestaInstrList(trHashTable[n],tempInstruction);
    }



    /** Deallocates the memory occupied by the list made by transitionElements **/
    emptyTransitionElementList(trElemHead);


    /** SAVES THE INPUT STRINGS OF THE TM IN THE TAPE **/
    tape *current, *temp;
    int i;
    char a;

    while(1) {
        tmTape = (tape*) malloc(sizeof(tape)); // NON ALLOCARE SEMPRE UNA NUOVA TAPE PER LA NUOVA STRINGA, USA QUELLA VECCHIA! oppure non puoi
        tmTape->next = NULL;
        tmTape->previous = NULL;
        tmTape->leftBound = 0;
        tmTape->rightBound = 0;
        current = tmTape;
        int inputOver = 0;
        i=0;
        while(!inputOver){

            scanf("%c",&a);

            /** EOF **/
            if(feof(stdin)) {
                if (i > 0) {
                    compute(nCharacters, trHashTable, accStates, max, tmTape, letterToIndexConverter);
                }
                /** Deallocation **/
                for(int z = 0;z<dim;z++){
                    emptyInstructionList(trHashTable[z]);
                }
                emptyAcceptanceStateList(accStates);
                return 0;
            }

            /** \n **/
            if( a == '\n') {
                inputOver = 1;
                if(i>0)
                    compute(nCharacters, trHashTable, accStates, max, tmTape, letterToIndexConverter);
                else {
                    printf("0\n");
                    cleanTape(tmTape);
                }
            }

            /** Input's not over **/
            if(!inputOver){

                /** the string is larger than the tape's vector **/
                if (i >= NLETTERS) {
                    i = 0;
                    temp = (tape*)malloc(sizeof(tape));
                    temp->leftBound = 0;
                    temp->previous = current;
                    temp->next = NULL;
                    current->next = temp;
                    current = current->next;
                }
                /** saves the character in the tape **/
                current->letter[i] = a;
                current->rightBound = i;
                i++;
            }
        }
    }
}




