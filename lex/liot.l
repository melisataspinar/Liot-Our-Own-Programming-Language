%option main
digit 		[0-9]
sign 		(\+|-)
char		[a-zA-Z]
alphanumeric 	({char}|{digit})

COMMA 		,
SEMICOLON	;
COLON		:
LP		\(
RP		\)
EQ		=
STARSTAR	\*\*
PLUS		\+
MINUS		-
STAR		\*
SLASH		\/
PERCENT		%
LSB		\[
RSB		\]
LESS		<
GREATER		>
LESSEQ		<=
GREATEREQ	>=
ISEQ		==
NOTEQ		!=
NOT		!
AND		&
OR		\|

RETURN		return
IF		if
ELIF		elif
ELSE		else
ENDIF		endif
FUNCT		funct
ENDFUNCT	endfunct
FOR		for
ENDFOR		endfor
WHILE		while
ENDWHILE	endwhile
IN		in
TRUE		True
FALSE		False	

TIME		@time
READSENSOR	@read_sensor
SENSORSLIST	@sensors_list
CHECKCONNECT	@check_connection
TRYCONNECT	@try_connection
FLIPSWITCH	@flip_switch
SETSWITCH	@set_switch
SHOUT		@shout
LISTEN		@listen
PRINT		@print
SUBTSR		@substr
TOSTR		@to_str
TONUM		@to_num

INTEGER		{digit}+
FLOAT 		{digit}*\.{digit}+
VARID		{char}+({alphanumeric}|_)*
FUNCNAME	@({alphanumeric}|_)*
STRING		\"[^\"]*\"
COMMENT		#[^#]*#

%%
{COMMA}		printf("COMMA ");
{SEMICOLON}	printf("SEMICOLON ");
{COLON}		printf("COLON ");
{LP}		printf("LP ");
{RP}		printf("RP ");
{EQ}		printf("EQ ");
{STARSTAR}	printf("STARSTAR ");
{PLUS}		printf("PLUS ");
{MINUS}		printf("MINUS ");
{STAR}		printf("STAR ");
{SLASH}		printf("SLASH ");
{PERCENT}	printf("PERCENT ");
{LSB}		printf("LSB ");
{RSB}		printf("RSB ");
{LESS}		printf("LESS ");
{GREATER}	printf("GREATER ");
{LESSEQ}	printf("LESSEQ ");
{GREATEREQ}	printf("GREATEREQ ");
{ISEQ}		printf("ISEQ ");
{NOTEQ}		printf("NOTEQ ");
{NOT}		printf("NOT ");
{AND}		printf("AND ");
{OR}		printf("OR ");

{RETURN}	printf("RETURN ");
{IF}		printf("IF ");
{ELIF}		printf("ELIF ");
{ELSE}		printf("ELSE ");
{ENDIF}		printf("ENDIF ");
{FUNCT}		printf("FUNCT ");
{ENDFUNCT}	printf("ENDFUNCT ");
{FOR}		printf("FOR ");
{ENDFOR}	printf("ENDFOR ");
{WHILE}		printf("WHILE ");
{ENDWHILE}	printf("ENDWHILE ");
{IN}		printf("IN ");
{TRUE}		printf("TRUE ");
{FALSE}		printf("FALSE ");

{TIME}		printf("TIME ");
{READSENSOR}	printf("READSENSOR ");
{SENSORSLIST}	printf("SENSORSLIST ");
{CHECKCONNECT}	printf("CHECKCONNECT ");
{TRYCONNECT}	printf("TRYCONNECT ");
{FLIPSWITCH}	printf("FLIPSWITCH ");
{SETSWITCH}	printf("SETSWITCH ");
{SHOUT}		printf("SHOUT ");
{LISTEN}	printf("LISTEN ");
{PRINT}		printf("PRINT ");
{SUBTSR}	printf("SUBTSR ");
{TOSTR}		printf("TOSTR ");
{TONUM}		printf("TONUM ");

{INTEGER}	printf("INTEGER ");
{FLOAT}		printf("FLOAT ");
{VARID}		printf("VARID ");
{FUNCNAME}	printf("FUNCNAME ");
{STRING}	printf("STRING ");
{COMMENT}	printf("COMMENT ");

[ \t]		;

%%

