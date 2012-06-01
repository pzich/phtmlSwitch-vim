<!-- This is just a simple PHP file for testing functionality. -->
<!DOCTYPE html>
<html>
	<head>
		<title>phtmlSwitch Test</title>
	</head>
	<body>
		<div>
<?php
function test(){
	if(test()){
		test();
	}
}
?>
		</div>
		<div>
<?= test() ?>
		</div>
		<div>
<?
function test(){
	if(test()){
		test();
	}
}
?>
		</div>
	</body>
</html>
