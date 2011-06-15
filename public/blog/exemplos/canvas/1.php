<?php
require( 'canvas.php' );
$img = new canvas();
$img->carrega( 'cats.jpg' )->hexa( '#FF005C' )->redimensiona( 400, 200, 'preenchimento' )->grava();
exit;