<?php

include_once(dirname(dirname(__FILE__)) . "/config.php");

$root=WEBSITEROOT_LOCALPATH;
$newfolder = $root . $_POST["folder"];

$parent = dirname($newfolder);

if(!is_writable($parent)) {
	echo "Write permission required";
	exit();
}

if(!file_exists ($newfolder)) {
	//create the folder
	mkdir($newfolder);
} else {
	echo "Folder already exists.";
}
?>