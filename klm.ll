
VARIABLE ^[a-zA-Z]+[a-zA-Z0-9]*
CONSTANT ^[0-9]+$
STRING \"([^\\\"]|\\.)*\"

%%

{STRING} printf("Essa é a string %s !\n", yytext);

[=]|[+]|[*] printf("Esse é o operador matemático %s !\n", yytext);

==|<= printf("Esse é o operador lógico %s !\n", yytext);

[:]|[(]|[)]|[,] printf("Esse é o símbolo %s !\n", yytext);

uitvoer|invoer|heel|als|voor|beginnen|einden printf("Essa é a palavra reservada %s !\n", yytext);

{VARIABLE} printf("Essa é a variável %s !\n", yytext);

{CONSTANT} printf("Essa é a constante %s !\n", yytext);

"{"[^}\n]*"}"     /* ignorar comentários de uma linha */

[ \t\n]+          /* ignorar espaço em branco */

.           printf( "Sua entrada não é reconhecida !\n" );

%%

int main()
{
  printf("Olá, usuário! Digite sua entrada abaixo e confira se ela faz parte da linguagem KLM!\n");
  printf("Sua entrada:\n");
  yylex();
  return 0;
}
