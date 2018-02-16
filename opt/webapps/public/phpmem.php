<?php
  echo "<html><body>\n";
  echo "<h3>PHP System Statistics</h3>\n";
  echo "<i>Memory Limit:</i> <b>", ini_get('memory_limit'), "</b> bytes<br>\n";
  echo "<i>Memory Current Usage:</i> <b>", memory_get_usage(1), "</b> bytes<br>\n";
  echo "<i>Memory Peak Usage:</i> <b>", memory_get_peak_usage(1), "</b> bytes<p>\n";
  echo "</body></html>\n";
?>
