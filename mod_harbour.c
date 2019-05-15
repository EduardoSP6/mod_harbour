#include "httpd.h"
#include "http_core.h"
#include "http_protocol.h"
#include "http_request.h"

static void register_hooks( apr_pool_t * pool );
static int harbour_handler( request_rec * r );

module AP_MODULE_DECLARE_DATA harbour_module =
{
    STANDARD20_MODULE_STUFF,
    NULL,            // Per-directory configuration handler
    NULL,            // Merge handler for per-directory configurations
    NULL,            // Per-server configuration handler
    NULL,            // Merge handler for per-server configurations
    NULL,            // Any directives we may have for httpd
    register_hooks   // Our hook registering function
};

static void register_hooks( apr_pool_t * pool ) 
{
   ap_hook_handler( harbour_handler, NULL, NULL, APR_HOOK_LAST );
}

static int harbour_handler( request_rec * r )
{
   if( ! r->handler || strcmp( r->handler, "harbour-handler" ) ) 
      return DECLINED;
   
   ap_rprintf( r, "called file: %s\n\n", r->filename );
   
   if( r->args ) 
      ap_rprintf( r, "Provided arguments: %s", r->args );
    
   return OK;
}