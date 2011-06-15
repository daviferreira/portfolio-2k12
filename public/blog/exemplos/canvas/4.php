<?php
$filtro 		= isset( $_GET['filtro'] ) ? trim( addslashes( $_GET['filtro'] ) ) : NULL;
$quantidade 	= isset( $_GET['quantidade'] ) ? trim( addslashes( $_GET['quantidade'] ) ) : 1;
$arg1 			= isset( $_GET['arg1'] ) ? trim( addslashes( $_GET['arg1'] ) ) : NULL;
$arg2 			= isset( $_GET['arg2'] ) ? trim( addslashes( $_GET['arg2'] ) ) : NULL;
$arg3 			= isset( $_GET['arg3'] ) ? trim( addslashes( $_GET['arg3'] ) ) : NULL;
$arg4 			= isset( $_GET['arg4'] ) ? trim( addslashes( $_GET['arg4'] ) ) : NULL;

require( 'canvas.php' );
$img = new canvas();
$img->carrega( 'cats.jpg' )
	->redimensiona( '50%' )
	->filtra( $filtro, $quantidade, $arg1, $arg2, $arg3, $arg4 )
	->grava();
exit;