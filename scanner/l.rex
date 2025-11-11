/* Project:  COCKTAIL training
 * Descr:    a simple scanner generated with rex
 * Kind:     REX scanner specification (solution)
 * Author:   Dr. Juergen Vollmer <juergen.vollmer@informatik-vollmer.de>
 * $Id: l.rex.in,v 1.18 2021/11/04 08:26:00 vollmer Exp $
 */

SCANNER l_scan

EXPORT {
/* code to be put into Scanner.h */

# include "Position.h"

/* Token Attributes.
 * For each token with user defined attributes, we need a typedef for the
 * token attributes.
 * The first struct-field must be of type tPosition!
 */
typedef struct {tPosition Pos; long Value;} tint_const;
typedef struct {tPosition Pos; char* Value;} tstring_const;
typedef struct {tPosition Pos; char* Value;} tfloat_const;
typedef struct {tPosition Pos; char* Value;} tidentifier;
typedef struct {tPosition Pos; char* Value;} ttyp;

/* There is only one "actual" token, during scanning. Therfore
 * we use a UNION of all token-attributes as data type for that unique
 * token-attribute variable.
 * All token (with and without user defined attributes) have one
 * attribute: the source position:
 *     tPosition     Position;
 */
typedef union {
  tPosition     Position;
  tint_const    int_const;
  tstring_const string_const;
  tfloat_const  float_const;
  tidentifier   identifier;
  ttyp          typ;
} l_scan_tScanAttribute;

/* Tokens are coded as int's, with values >=0
 * The value 0 is reserved for the EofToken, which is defined automatically
 */
# define tok_typ              1
# define tok_int_const        2
# define tok_float_const      3
# define tok_trennlinie       4
# define tok_string_const     5
# define tok_plus             6
# define tok_minus            7
# define tok_identifier       8
# define tok_multiply         9
# define tok_divide           10
# define tok_assign           11
# define tok_less             12
# define tok_greater          13
# define tok_equal            14
# define tok_not_equal        15
# define tok_increment        16
# define tok_decrement        17
# define tok_and              18
# define tok_or               19
# define tok_lparen           20
# define tok_rparen           21
# define tok_colon            22
# define tok_semicolon        23
# define tok_comma            24
# define tok_program          25
# define tok_begin            26
# define tok_end              27
# define tok_while            28
# define tok_if               29
# define tok_else             30
# define tok_for              31
} // EXPORT

GLOBAL {
  # include <stdlib.h>
  # include "rString.h"
} // GLOBAL

LOCAL {
 /* user-defined local variables of the generated GetToken routine */
}  // LOCAL

DEFAULT {
  /* What happens if no scanner rule matches the input */
  MessageI ("Illegal character", xxError, l_scan_Attribute.Position, xxCharacter, l_scan_TokenPtr);
} // DEFAULT

EOF {
  /* What should be done if the end-of-input-file has been reached? */

  /* E.g.: check that strings and comments are closed. */
  switch (yyStartState) {
  case STD:
    /* ok */
    break;
  default:
    Message ("OOPS: that should not happen!!", xxFatal, l_scan_Attribute.Position);
    break;
  }

  /* implicit: return the EofToken */
} // EOF

DEFINE  /* some abbreviations */
  digit           = {0-9}       .
  letter          = {a-z}       .
  capital_letter  = {A-Z}       .
  whitespace      = {" "\t\n\r} .
  string_char     = - {\"\n}    .

/* define start states, note STD is defined by default, separate several states by a comma */
/* START STRING */

RULE

/* Whitespace - ignore */
#STD# whitespace+ :
        {/* skip whitespace */
        }

/* Keywords */
#STD# program :
        {return tok_program;
        }

#STD# begin :
        {return tok_begin;
        }

#STD# end :
        {return tok_end;
        }

#STD# while :
        {return tok_while;
        }

#STD# if :
        {return tok_if;
        }

#STD# else :
        {return tok_else;
        }

#STD# for :
        {return tok_for;
        }

/* Keywords (Typ) */
#STD# int | float | string :
        {l_scan_Attribute.typ.Value = malloc (l_scan_TokenLength+1);
         l_scan_GetWord (l_scan_Attribute.typ.Value);
         return tok_typ;
        }

/* Integers */
#STD# digit+ :
        {l_scan_Attribute.int_const.Value = atol (l_scan_TokenPtr);
         return tok_int_const;
        }

/* Float numbers */
#STD# digit+ \. digit+ :
        {l_scan_Attribute.float_const.Value = malloc (l_scan_TokenLength+1);
         l_scan_GetWord (l_scan_Attribute.float_const.Value);
         return tok_float_const;
        }

/* Trennlinie */
#STD# \.\.\.+ :
        {return tok_trennlinie;
        }

/* String constants */
#STD# \" string_char* \" :
        {l_scan_Attribute.string_const.Value = malloc (l_scan_TokenLength+1);
         l_scan_GetWord (l_scan_Attribute.string_const.Value);
         return tok_string_const;
        }

/* Multi-character Operators (must come before single-character ones) */
#STD# \<= :
        {return tok_assign;
        }

#STD# == :
        {return tok_equal;
        }

#STD# != :
        {return tok_not_equal;
        }

#STD# \+\+ :
        {return tok_increment;
        }

#STD# \-\- :
        {return tok_decrement;
        }

#STD# && :
        {return tok_and;
        }

#STD# \|\| :
        {return tok_or;
        }

/* Single-character Operators */
#STD# \+ :
        {return tok_plus;
        }

#STD# \- :
        {return tok_minus;
        }

#STD# \* :
        {return tok_multiply;
        }

#STD# \/ :
        {return tok_divide;
        }

#STD# \< :
        {return tok_less;
        }

#STD# \> :
        {return tok_greater;
        }

/* Delimiters */
#STD# \( :
        {return tok_lparen;
        }

#STD# \) :
        {return tok_rparen;
        }

#STD# \: :
        {return tok_colon;
        }

#STD# ; :
        {return tok_semicolon;
        }

#STD# \, :
        {return tok_comma;
        }

/* Identifiers */
#STD# (letter | capital_letter) (letter | capital_letter | digit)* :
        {l_scan_Attribute.identifier.Value = malloc (l_scan_TokenLength+1);
         l_scan_GetWord (l_scan_Attribute.identifier.Value);
         return tok_identifier;
        }

/* Please add rules for: (don't forget to adapt main()) */
/* Float numbers */

/* case insensitive keywords: BEGIN PROCEDURE END CASE */

/* identifiers */

/* comment up to end of line */

/* C-style comment */

/* Modula2-style nested comment */

/* double quote delimited strings */
/**********************************************************************/

