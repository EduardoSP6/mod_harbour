#xcommand ? <cText> => AP_RPuts( <cText> )

function Main()

   ? AP_HeadersOutCount() 
   ? "<br>"

   AP_HeadersOutSet( "Location", "test.prg" )

   ? AP_HeadersOutCount()
   ? "<br>"

   AP_HeadersOutSet( "Set-Cookie", "cookie-name=harbour;expires=20190529" )
   
   ? AP_HeadersOutCount()
   ? "<br>"

return nil