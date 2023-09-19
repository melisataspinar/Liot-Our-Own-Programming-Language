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
SUBSTR		@substr
TOSTR		@to_str
TONUM		@to_num

INTEGER		{digit}+
FLOAT 		{digit}*\.{digit}+
VARID		{char}+({alphanumeric}|_)*
FUNCNAME	@({alphanumeric}|_)+
STRING		\"[^\"]*\"
COMMENT		#[^#]*#

%%
{COMMA}		return COMMA;
{SEMICOLON}	return SEMICOLON;
{COLON}		return COLON;
{LP}		return LP;
{RP}		return RP;
{EQ}		return EQ;
{STARSTAR}	return STARSTAR;
{PLUS}		return PLUS;
{MINUS}		return MINUS;
{STAR}		return STAR;
{SLASH}		return SLASH;
{PERCENT}	return PERCENT;
{LSB}		return LSB;
{RSB}		return RSB;
{LESS}		return LESS;
{GREATER}	return GREATER;
{LESSEQ}	return LESSEQ;
{GREATEREQ}	return GREATEREQ;
{ISEQ}		return ISEQ;
{NOTEQ}		return NOTEQ;
{NOT}		return NOT;
{AND}		return AND;
{OR}		return OR;

{RETURN}	return RETURN;
{IF}		return IF;
{ELIF}		return ELIF;
{ELSE}		return ELSE;
{ENDIF}		return ENDIF;
{FUNCT}		return FUNCT;
{ENDFUNCT}	return ENDFUNCT;
{FOR}		return FOR;
{ENDFOR}	return ENDFOR;
{WHILE}		return WHILE;
{ENDWHILE}	return ENDWHILE;
{IN}		return IN;
{TRUE}		return TRUE;
{FALSE}		return FALSE;

{TIME}		return TIME;
{READSENSOR}	return READSENSOR;
{SENSORSLIST}	return SENSORSLIST;
{CHECKCONNECT}	return CHECKCONNECT;
{TRYCONNECT}	return TRYCONNECT;
{FLIPSWITCH}	return FLIPSWITCH;
{SETSWITCH}	return SETSWITCH;
{SHOUT}		return SHOUT;
{LISTEN}	return LISTEN;
{PRINT}		return PRINT;
{SUBSTR}	return SUBSTR;
{TOSTR}		return TOSTR;
{TONUM}		return TONUM;

{INTEGER}	return INTEGER;
{FLOAT}		return FLOAT;
{VARID}		return VARID;
{FUNCNAME}	return FUNCNAME;
{STRING}	return STRING;
{COMMENT}	return COMMENT;

\n		{ extern int lineno; lineno++; }
[ \t]		;
.		return yytext[0];

%%
int yywrap() 	{ return 1; }
