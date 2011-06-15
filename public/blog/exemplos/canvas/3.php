<?php
require( 'canvas.php' );
$img = new canvas();
$img->carrega( 'cats.jpg' )
	->redimensiona( 400, 400, 'crop' )
	->hexa( '#fff' )
	->legenda( 'LOL Catz!', 20, 'meio', 'centro', '#FF005C', true, 'Aller_Bd.ttf' )
	->grava();
exit;