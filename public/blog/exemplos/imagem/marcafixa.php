<?php
// include da classe m2brimagem
include('m2brimagem.class.php');

// parâmetros via GET/URL
$arquivo	= $_GET['arquivo'];
$largura	= $_GET['largura'];
$altura		= $_GET['altura'];
$tipo		= $_GET['tipo'];

// instancia objeto m2brimagem
$oImg = new m2brimagem( $arquivo );
// valida arquivo/imagem
$valida = $oImg->valida();
// redimensiona com saída no browser
if ( $valida == 'OK' ) {
    $oImg->redimensiona($largura,$altura,'crop');
    $oImg->marcaFixa('marca2.png',$tipo);
	$oImg->grava();
	// mensagem de erro
} else {
	die($valida);
}

exit;

?>
