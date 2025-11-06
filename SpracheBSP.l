%{
	#include <stdio.h>
%}
Ziffer          [0-9]    
Buchstabe       [a-z]
Grossbuchstabe  [A-Z]
Leerzeichen     [" "]
Plus            ["+"]
Minus           ["\-"]

%%

("int"|"float"|"string")                                                {printf("Typ\n");}
{Ziffer}+                                                               {printf("GanzzahlLiteral\n");}
({Ziffer}+"."{Ziffer}*)                                                 {printf("GleitkommaLiteral\n");}
"..""."+                                                                {printf("Trennlinie\n");}
\"({Buchstabe}|{Grossbuchstabe})*\"                                     {printf("Zeichenkette\n");}
{Plus}                                                                  {printf("Plus\n");}
{Minus}                                                                 {printf("Minus\n");}
({Buchstabe}|{Grossbuchstabe})({Buchstabe}|{Grossbuchstabe}|{Ziffer})*  {printf("Bezeichner\n");}


%%