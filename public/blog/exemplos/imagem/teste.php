<?php
// include da classe m2brimagem
include('m2brimagem.class.php');
// instancia objeto m2brimage
$oImg = new m2brimagem('1.jpg');
// valida arquivo/imagem
$valida = $oImg->valida();
// redimensiona com saída no browser
if ($valida == 'OK') {
	$oImg->redimensiona(200,200,'crop','');
    $oImg->grava();
// mensagem de erro
} else {
	die($valida);
}
exit;
?>