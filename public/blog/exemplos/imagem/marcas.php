<?php
ini_set('error_reporting', E_ALL);

$tipos = array(	'topo_esquerda', 'topo_centro', 'topo_direita',
				'meio_esquerda', 'meio_centro', 'meio_direita',
				'baixo_esquerda', 'baixo_centro', 'baixo_direita');

foreach ($tipos as $tipo) {
	echo '<div style="width:200px;float:left;height:180px;color:#666;font-family:arial;background-color:#eee;padding:4px;margin:4px;border:1px solid #ccc;text-align:center;"><img src="marcafixa.php?arquivo=2.jpg&altura=150&largura=150&tipo='.$tipo.'" /><br><strong>'.$tipo.'</strong></div>';
}

exit;

?>
