#include "symtable.h"
#include <string.h>


extern struct Symboltable symtable[20];
extern int currentPos;


int search(char* p){

	int i=0;
	for(i=0;i<currentPos;i++)
		if(strcmp(symtable[i].name,p)==0)
			return i;
	return -1;
}



void insert(char* p,int value){
        
	int pos=search(p);

	if(pos==-1){
		
		strcpy(symtable[currentPos].name,p);
		symtable[currentPos].value=value;
		currentPos++;
	}
	else{
		symtable[pos].value=value;
	}


}

void reset(){
currentPos=0;
}
/*
void printall(){

	printf("____SYMBOL TABLE___\n");
	 for(i=0;i<currentPos;i++)
		 

}*/


