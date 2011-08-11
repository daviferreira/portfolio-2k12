<?php
error_reporting(E_ALL ^ E_NOTICE ^ E_USER_NOTICE);
ini_set( 'display_errors','On' );
ini_set('display_startup_errors',true);

require( 'canvas.php' );
$img = new canvas();
$img->hexa( '#ff0000' )
	->novaImagem( 300, 300 )
	->hexa( '#fff' )
	->legenda( 'FLAMENGO', 20, 'meio', 'centro', '#000', true, dirname(__FILE__).'/Aller_Bd.ttf' )
	->grava();
exit;
