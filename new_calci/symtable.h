
struct Symboltable{
	char name[20];
	int value;
};

struct Symboltable symtable[20];
int currentPos;

int search(char*);
void insert(char*,int);


void reset();
