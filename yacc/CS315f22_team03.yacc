%token COMMA SEMICOLON COLON LP RP EQ STARSTAR PLUS MINUS STAR SLASH PERCENT LSB RSB
%token LESS GREATER LESSEQ GREATEREQ ISEQ NOTEQ NOT AND OR
%token RETURN IF ELIF ELSE ENDIF FUNCT ENDFUNCT FOR ENDFOR WHILE ENDWHILE IN
%token TRUE FALSE
%token INTEGER FLOAT VARID FUNCNAME STRING COMMENT
%token TIME READSENSOR SENSORSLIST CHECKCONNECT TRYCONNECT FLIPSWITCH SETSWITCH
%token SHOUT LISTEN PRINT SUBSTR TOSTR TONUM
%%
program: stmts { printf("input program is valid\n"); }
	;
stmts: empty 
	| stmts stmt
	;
stmt: if 
	| function_declaration
	| return
	| loop
	| assignment
	| expr_stmt
	| COMMENT
	;


if: IF LP logic_expr_general RP stmts elseifs ENDIF
	| IF LP logic_expr_general RP stmts elseifs ELSE stmts ENDIF
	;
elseifs: empty
	| elseifs ELIF LP logic_expr_general RP stmts
	;
function_declaration: FUNCT FUNCNAME LP params RP stmts ENDFUNCT
	;
params: empty
	| varids
	;
varids: VARID
	| varids COMMA VARID
	;
return: RETURN exprs SEMICOLON
	;
loop: for_loop
	| while_loop
	;
for_loop: FOR LP VARID IN expr RP stmts ENDFOR
	;
while_loop: WHILE LP logic_expr_general RP stmts ENDWHILE
	;
function_call: FUNCNAME LP exprs RP 
	| prim_func_call
	;
prim_func_call: TIME LP RP
	| READSENSOR LP expr RP
	| SENSORSLIST LP RP
	| CHECKCONNECT LP RP
	| TRYCONNECT LP expr RP
	| FLIPSWITCH LP expr RP
	| SETSWITCH LP expr COMMA expr RP
	| SHOUT LP expr COMMA expr RP
	| LISTEN LP expr RP
	| PRINT LP expr RP
	| SUBSTR LP expr COMMA expr COMMA expr RP
	| TOSTR LP expr RP
	| TONUM LP expr RP
	;
assignment: varids EQ expr_list SEMICOLON
	;
expr_stmt: expr SEMICOLON
	;


exprs: empty 
	| expr_list
	;
expr_list: expr
	| expr_list COMMA expr
	;
expr: logic_expr
	| arith_expr
	| list_expr
	| string_expr
	;
general_term: VARID
	| function_call
	;

list_index: LSB expr RSB
	| list_index LSB expr RSB
	;

logic_expr_general: logic_expr
	| general_term
	;
logic_expr: logic_expr OR logic_term1
	| logic_expr OR general_term
	| general_term OR general_term
	| general_term OR logic_term1
	| logic_term1
	;
logic_term1: logic_term1 AND logic_term2
	| logic_term1 AND general_term
	| general_term AND general_term
	| general_term AND logic_term2
	| logic_term2
	;
logic_term2: bool
	| LP logic_expr RP
	| NOT logic_term2
	| NOT general_term
	| relational_expr
	;

relational_expr: relational_op arith_expr COLON arith_expr

arith_expr: ad_term
	| arith_expr ad_op ad_term
	;
ad_term: mult_term
	| ad_term mult_op mult_term
	;
mult_term: exp_term
	| exp_term STARSTAR mult_term
	;
exp_term: numeric
	| VARID
	| VARID list_index
	| function_call
	| function_call list_index
	| LP arith_expr RP
	| MINUS exp_term
	;

string_expr: STRING
	| string_expr PLUS STRING
	;
list_expr: list_term
	| list_expr PLUS list_term
	;
list_term: LSB exprs RSB
	| numeric COLON numeric COLON numeric
	;

bool: TRUE
	| FALSE
	;
numeric: FLOAT
	| INTEGER
	;
ad_op: PLUS
	| MINUS
	;
mult_op: STAR
	| SLASH
	| PERCENT
	;
relational_op: LESS
	| GREATER
	| LESSEQ
	| GREATEREQ
	| ISEQ
	| NOTEQ
	;
empty: 
	;

%%
#include "lex.yy.c"
int lineno=1;
int yyerror(char *s) { printf("syntax error at line %d\n", lineno); return 0; }
int main() {
	return yyparse();
}