#include <stdio.h>

#define N 600000000


int i=0;
int a = 0;
float b = 1103515245.0;

float c = 12345.0;
int m = (1<<30)-1;
float x = 98765;

void g()

{

}

void f()

{

}

int main()
{

  printf("%x\n",&i);
  for (i = 1; i<=N; i++) {
        g();
        f();
  }

  return 0;

}
