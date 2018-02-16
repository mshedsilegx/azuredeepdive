<?php

/* MEMCACHE Configuration File */

// Disable MEMCACHE Auth
define('USE_AUTHENTICATION',0);

define('DATE_FORMAT','Y/m/d H:i:s');
define('GRAPH_SIZE',200);
define('MAX_ITEM_DUMP',50);

$MEMCACHE_SERVERS[0] = '127.0.0.1:11211'; // add more as an array

?>
