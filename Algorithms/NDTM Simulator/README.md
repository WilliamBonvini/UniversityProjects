# NDTM Simulator - Academic year 2016/2017

Project for the course Algorithms and Informatics Principles as taught in Politecnico di Milano during the academic year 2016/2017. 

It consists in writing a simulator for any Non Deterministic Turing Machine in C, with time and space complexity constraints.

Final mark: 28/30

### Protocol

The structure of the input file is divided in 4 parts:
- the first part, which starts with "tr", contains the transitions, one each line. any character can be separated from the others by whitespaces.
For example, "0 a c R 1" means that the initial state is 0 and that reading 'a' we go to state 1, writing 'c' and moving the tape head to the right.
- The second part, which starts with "acc", lists all the acceptance states , one each line.
- In order to avoid infinite computations problems, in the following section, which starts with "max", is indicated the maximum number of actions that can be done in order to accept a string.
- The final part, which starts with "run", is a list of input strings, one each line.

Example: MT non-det. for ww
acc   
7   
max   
800   
run   
aababbabaa   
aababbabaaaababbabaa   
aababbabaaaababbabaab   
aababbabaaaababbabaabbaababbabaaaababbabaa   
aababbabbaaababbabaabbaababbabaaaababbabaa  
tr  
0 a a R 0   
0 b b R 0   
0 a c R 1   
0 b c R 2   
1 a c L 3   
2 b c L 3   
3 c c L 3    
3 a c R 4   
3 b c R 5   
4 c c R 4   
4 a c L 3   
5 c c R 5   
5 b c L 3   
3 _ _ R 6   
6 c c R 6   
6 _ _ S 7  
Standard output: 1 1 0 U 0  

output legenda:  
1 -> accepted  
0 -> not accepted   
U -> Undefined  
