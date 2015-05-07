<?php

include_once(dirname(dirname(__FILE__)) . "/config.php");

$root=WEBSITEROOT_LOCALPATH;
$file = $root . $_POST["file"];

if(file_exists ($file)) {
	unlink($file);
} else {

}

?>