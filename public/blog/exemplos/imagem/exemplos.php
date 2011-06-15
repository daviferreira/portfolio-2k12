<?php
// include da classe m2brimagem
include('m2brimagem.class.php');
// instancia objeto m2brimagem
$oImg = new m2brimagem();
// marca d'água
$oImg->carrega('1.jpg');
if ($oImg->valida() == 'OK') {
	// adiciona marca d'água
	$oImg->marca('marca.png',40,160,100);
	$oImg->grava();
}
exit;
?>