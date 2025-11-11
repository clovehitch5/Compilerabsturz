/* Project:  COCKTAIL training
 * Descr:    A simple scanner generated with rex
 * Kind:     C-main function, fully implemented solution
 * Author:   Dr. Juergen Vollmer <juergen.vollmer@informatik-vollmer.d
 * $Id: main.c,v 1.1 2022/11/24 08:18:31 vollmer Exp vollmer $
 */

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include "Position.h"
# include "l_scan.h"

int main (int argc, char *argv[])
{
   int Token, Count = 0;
   if (argc == 2) {
     if (strcmp (argv[1], "-h") == 0) {
       fprintf (stderr,
		"usage: scan [-h] [file]\n"
		"  simple scanner, reads `file' or stdin\n"
		"  -h: Help\n");
       exit (0);
     }
     l_scan_Attribute.Position.FileName = MakeIdent1 (argv[1]);
     l_scan_BeginFile (argv[1]);
     /* Read from file argv[1].
      * If this routine is not called, stdin is read.
      */
   }
   for (Token =  l_scan_GetToken ();
	Token != l_scan_EofToken;
	Token = l_scan_GetToken ()) {
      Count ++;
      WritePosition (stdout, l_scan_Attribute.Position); printf (" ");
      switch (Token) {
      case tok_int_const:
	printf ("int_const    : %ld\n",l_scan_Attribute.int_const.Value);
	break;
      case tok_float_const:
	printf ("float_const  : %s\n", l_scan_Attribute.float_const.Value);
	break;
      case tok_string_const:
	printf ("string_const : %s\n", l_scan_Attribute.string_const.Value);
	break;
      case tok_identifier:
	printf ("identifier   : %s\n", l_scan_Attribute.identifier.Value);
	break;
      case tok_typ:
	printf ("typ          : %s\n", l_scan_Attribute.typ.Value);
	break;
      case tok_program:
	printf ("program\n");
	break;
      case tok_begin:
	printf ("begin\n");
	break;
      case tok_end:
	printf ("end\n");
	break;
      case tok_while:
	printf ("while\n");
	break;
      case tok_if:
	printf ("if\n");
	break;
      case tok_else:
	printf ("else\n");
	break;
      case tok_for:
	printf ("for\n");
	break;
      case tok_trennlinie:
	printf ("trennlinie\n");
	break;
      case tok_assign:
	printf ("assign       : <=\n");
	break;
      case tok_plus:
	printf ("plus         : +\n");
	break;
      case tok_minus:
	printf ("minus        : -\n");
	break;
      case tok_multiply:
	printf ("multiply     : *\n");
	break;
      case tok_divide:
	printf ("divide       : /\n");
	break;
      case tok_less:
	printf ("less         : <\n");
	break;
      case tok_greater:
	printf ("greater      : >\n");
	break;
      case tok_equal:
	printf ("equal        : ==\n");
	break;
      case tok_not_equal:
	printf ("not_equal    : !=\n");
	break;
      case tok_increment:
	printf ("increment    : ++\n");
	break;
      case tok_decrement:
	printf ("decrement    : --\n");
	break;
      case tok_and:
	printf ("and          : &&\n");
	break;
      case tok_or:
	printf ("or           : ||\n");
	break;
      case tok_lparen:
	printf ("lparen       : (\n");
	break;
      case tok_rparen:
	printf ("rparen       : )\n");
	break;
      case tok_colon:
	printf ("colon        : :\n");
	break;
      case tok_semicolon:
	printf ("semicolon    : ;\n");
	break;
      case tok_comma:
	printf ("comma        : ,\n");
	break;
	/* add code to emit your tokens here */
      default:
	fprintf (stderr, "FATAL ERROR  ***********************************\n");
	fprintf (stderr, "FATAL ERROR: unknown token, it has code %d\n", Token);
	fprintf (stderr, "FATAL ERROR  ***********************************\n");
	abort();
    }
   }
   printf ("Token count: %d\n", Count);
   return 0;
}

