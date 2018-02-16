<html>
<body>

<?php
echo "<br><i>SYSTEM_DATE</i> | " . htmlentities(date('Y/m/d H:i:s'));
echo "<br><i>DOCUMENT_ROOT  </i> | " . htmlentities($_SERVER['DOCUMENT_ROOT']);
echo "<br><i>HTTP_HOST      </i> | " . htmlentities($_SERVER['HTTP_HOST']);
echo "<br><i>HTTP_HOST_IP   </i> | " . htmlentities(gethostbyname($_SERVER['HTTP_HOST']));
echo "<br><i>QUERY_STRING   </i> | " . htmlentities($_SERVER['QUERY_STRING']);
echo "<br><i>REMOTE_ADDR    </i> | " . htmlentities($_SERVER['REMOTE_ADDR']);
echo "<br><i>REQUEST_METHOD </i> | " . htmlentities($_SERVER['REQUEST_METHOD']);
echo "<br><i>REQUEST_URI    </i> | " . htmlentities($_SERVER['REQUEST_URI']);
echo "<br><i>SCRIPT_NAME    </i> | " . htmlentities($_SERVER['SCRIPT_NAME']);
echo "<br><i>SERVER_NAME    </i> | " . htmlentities($_SERVER['SERVER_NAME']);
echo "<br><i>SERVER_ADDR    </i> | " . htmlentities($_SERVER['SERVER_ADDR']);
echo "<br><i>SERVER_PORT    </i> | " . htmlentities($_SERVER['SERVER_PORT']);
echo "<br><i>SERVER_PROTOCOL</i> | " . htmlentities($_SERVER['SERVER_PROTOCOL']);
echo "<br><i>SERVER_SOFTWARE</i> | " . htmlentities($_SERVER['SERVER_SOFTWARE']);
?>

</body>
</html>
