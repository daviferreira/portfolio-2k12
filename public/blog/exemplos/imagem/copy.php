<?php
ini_set('error_reporting', E_ALL);
// include da classe m2brimagem
include('m2brimagem.class.php');
// instancia objeto m2brimagem
$oImg = new m2brimagem('2.jpg');
// valida arquivo/imagem
$valida = $oImg->valida();
// redimensiona com saída no browser
if ($valida == 'OK') {
	$oImg->redimensiona(150,150,'crop');
	$oImg->marca('marca.png',10,10,NULL);
    $oImg->grava();
// mensagem de erro	
} else {
	die($valida);
}
?>