<?php
require( 'canvas.php' );
$img = new canvas();
$img->hexa( '#ff0000' )
	->novaImagem( 300, 300 )
	->hexa( '#fff' )
	->legenda( 'FLAMENGO', 20, 'meio', 'centro', '#000', true, 'Aller_Bd.ttf' )
	->grava();
exit;