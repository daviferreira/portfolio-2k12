<?php
require( 'canvas.php' );
$img = new canvas();
$img->carrega( 'cats.jpg' )
	->redimensiona( '40%', '', 'crop' )
	->filtra( 'colorir', 1, 255, 70, 60, 40 )
	->flip()
	->hexa( '#fff' )
	->gira( 45 )
	->filtra( 'ruido', 1, 3 )
	->marca( 'marca.png', 'topo', 'esquerda' )
	->legenda( 'Criada automaticamente em '. date( 'd/m/Y H:i:s' ), 5, 'baixo', 'direita', '#000' )
	->legenda( 'Lol Catz!', 20, 'topo', 'direita', '#ff9900', true, 'Aller_Bd.ttf' )
	->grava();
exit;