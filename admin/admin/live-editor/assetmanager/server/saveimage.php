<?php

include_once(dirname(dirname(__FILE__)) . "/config.php");

$imageData = isset($_REQUEST['hidImage']) ? $_REQUEST['hidImage'] : "";
$tempPath = isset($_REQUEST['hidPath']) ? $_REQUEST['hidPath'] : "";
$filename = isset($_REQUEST['hidFile']) ? $_REQUEST['hidFile'] : "";

$root=WEBSITEROOT_LOCALPATH; //website root

$suffix = date("Y-m-d-H-i-s");

$filenew = $tempPath . $filename . "-" . $suffix . ".png";

$fileNameWitPath = $root . $filenew;

$fp = fopen( $fileNameWitPath, 'wb' );
fwrite( $fp, base64_decode($imageData));
fclose( $fp );

echo "<html><body onload=\"parent.imageSaved('" . $filenew . "')\"></body></html>";
?>
