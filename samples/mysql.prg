#xcommand ? <cText> => AP_RPuts( <cText> )

#define HB_DYN_CALLCONV_CDECL       0x0000000  /* C default */
#define HB_DYN_CTYPE_LONG_UNSIGNED  0x0000014
#define HB_DYN_CTYPE_CHAR_PTR       0x0000101
#define HB_DYN_CTYPE_LONG           0x0000004
#define NULL                        0x0000000         

static pLib, hMySQL, hConnection

function Main()
   
   pLib = hb_LibLoad( "/usr/lib/x86_64-linux-gnu/libmysqlclient.so" ) // libmysqlclient.so.20 for mariaDB
   hMySQL = mysql_init()

   ? "pLib = " + ValType( pLib ) + '<br>'
   ? "hMySQL = " + Str( hMySQL ) + '<br>'

   ? hConnection := mysql_real_connect( "localhost", "root", "passw", "DataBaseName" )

   ? HB_LibFree( pLib )                        

return nil

function mysql_init()

return hb_DynCall( { "mysql_init", pLib, HB_DYN_CALLCONV_CDECL }, NULL )

function mysql_real_connect( cServer, cUserName, cPassword, cDataBaseName )

return hb_DynCall( { "mysql_real_connect", hMySQL, HB_DYN_CALLCONV_CDECL, HB_DYN_CTYPE_LONG_UNSIGNED,;
                     HB_DYN_CTYPE_CHAR_PTR, HB_DYN_CTYPE_CHAR_PTR, HB_DYN_CTYPE_CHAR_PTR, HB_DYN_CTYPE_CHAR_PTR,;
                     HB_DYN_CTYPE_LONG, HB_DYN_CTYPE_LONG, HB_DYN_CTYPE_LONG },;
                     hMySQL, cServer, cUserName, cPassword, cDataBaseName, 0, 0, 0 )